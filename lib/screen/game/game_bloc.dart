import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matematica_vera/db/db_client.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/domain/game.dart';
import 'package:matematica_vera/domain/game_config.dart';
import 'package:matematica_vera/screen/game/game_bloc_events.dart';
import 'package:matematica_vera/screen/game/game_bloc_states.dart';

class GameBloc extends Bloc<GameBlocEvent, GameBlocState> {

  static const _highlight_selected_answer_duration_millis = 1000;

  final GameConfig config;

  GameBloc(this.config);

  @override
  GameBlocState get initialState => Loading.initial(showErrors: config.showErrorsCount);

  @override
  Stream<GameBlocState> mapEventToState(GameBlocEvent event) async*{

    if (event is Initialize) {
      yield Loading.from(state);
      final game = (await _currentGameOrNull(config)) ??
          (await _newlyInitializedGame(config));

      yield _game(game);
    }

    if (event is AnswerSelected) {
      final game = (await _currentGameOrNull(config));

      if (isAnswerCorrect(event.answer, game)) {
        yield DisplayCorrectAnswer.from(state,
            correctAnswer: event.answer,
            exerciseText: game.exercises[game.currentExerciseNumber].riddleAnswered);
        final updatedStoredGame = Game.toNextExercise(game);

        if (updatedStoredGame.currentExerciseNumber == config.numberOfExercises) {
          await dbClient.removeGame(config.id);
          await dbClient.insertStoredLastDoneGame(StoredLastDoneGame(
            id: config.id,
            dateTime: DateTime.now().toUtc()
          ));
        } else {
          await dbClient.insertGame(updatedStoredGame);
        }

        await Future.delayed(Duration(milliseconds: _highlight_selected_answer_duration_millis), () { });

        if (updatedStoredGame.currentExerciseNumber == config.numberOfExercises) {
          yield ExerciseFinished.from(state);
        } else {
          yield DisplayExercise.from(_game(updatedStoredGame));
        }
      } else {
        yield DisplayWrongAnswer.from(state, wrongAnswer: event.answer);

        final updatedStoredGame = Game.addError(game);
        await dbClient.insertGame(updatedStoredGame);

        await Future.delayed(Duration(milliseconds: _highlight_selected_answer_duration_millis), () { });

        yield DisplayExercise.from(_game(updatedStoredGame));
      }
    }
  }

  Future<Game> _currentGameOrNull(GameConfig config) async =>
      dbClient.getGameOrNull(config.id);

  Future<Game> _newlyInitializedGame(GameConfig config) async {
    final generatedGame = Game.fromConfig(config);
    await dbClient.insertGame(generatedGame);
    return _currentGameOrNull(config);
  }

  GameBlocState _game(Game storedGame) {
    final e = storedGame.exercises[storedGame.currentExerciseNumber];
    final possibleAnswers = e.possibleAnswers;
    possibleAnswers.shuffle(Random());

    return DisplayExercise.from(
        state,
        numberOfErrors: storedGame.errorCount,
        currentExerciseNumber: storedGame.currentExerciseNumber,
        exerciseCount:config.numberOfExercises,
        exerciseText: e.riddleObscured,
        possibleAnswers: possibleAnswers
    );
  }

  bool isAnswerCorrect(String answer, Game storedGame)  => answer ==
    storedGame.exercises[storedGame.currentExerciseNumber].correctAnswer;
}