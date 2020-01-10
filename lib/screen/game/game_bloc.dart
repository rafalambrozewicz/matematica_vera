import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matematica_vera/db/db_client.dart';
import 'package:matematica_vera/db/model/stored_game.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/game/game.dart';
import 'package:matematica_vera/game/game_config.dart';
import 'package:matematica_vera/screen/game/game_bloc_events.dart';
import 'package:matematica_vera/screen/game/game_bloc_states.dart';

class GameBloc extends Bloc<GameBlocEvent, GameBlocState> {

  static const _highlight_selected_answer_duration_millis = 1000;

  final GameConfig config;

  GameBloc(this.config);

  @override
  GameBlocState get initialState => Loading.initial();

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
            exerciseText: game.game.exercises[game.game.currentExerciseNumber].riddleAnswered);
        final updatedStoredGame = StoredGame.toNextExercise(game);

        if (updatedStoredGame.game.currentExerciseNumber == config.exerciseCount) {
          await dbClient.removeStoredGame(config.gameTag);
          await dbClient.insertStoredLastDoneGame(StoredLastDoneGame(
            gameTag: config.gameTag,
            dateTime: DateTime.now().toUtc()
          ));
        } else {
          await dbClient.insertStoredGame(updatedStoredGame);
        }

        await Future.delayed(Duration(milliseconds: _highlight_selected_answer_duration_millis), () { });

        if (updatedStoredGame.game.currentExerciseNumber == config.exerciseCount) {
          yield ExerciseFinished.from(state);
        } else {
          yield DisplayExercise.from(_game(updatedStoredGame));
        }
      } else {
        yield DisplayWrongAnswer.from(state, wrongAnswer: event.answer);

        await Future.delayed(Duration(milliseconds: _highlight_selected_answer_duration_millis), () { });

        yield DisplayExercise.from(_game(game));
      }
    }
  }

  Future<StoredGame> _currentGameOrNull(GameConfig config) async =>
      dbClient.getGameOrNull(config.gameTag);

  Future<StoredGame> _newlyInitializedGame(GameConfig config) async {
    final generatedGame = Game.fromConfig(config);
    await dbClient.insertStoredGame(StoredGame(
        gameTag: config.gameTag,
        game: generatedGame));
    return _currentGameOrNull(config);
  }

  GameBlocState _game(StoredGame storedGame) {
    final e = storedGame.game.exercises[storedGame.game.currentExerciseNumber];
    final possibleAnswers = e.possibleAnswers;
    possibleAnswers.shuffle(Random());

    return DisplayExercise.from(
        state,
        currentExerciseNumber: storedGame.game.currentExerciseNumber,
        exerciseCount:config.exerciseCount,
        exerciseText: e.riddleObscured,
        possibleAnswers: possibleAnswers
    );
  }

  bool isAnswerCorrect(String answer, StoredGame storedGame)  => answer ==
    storedGame.game.exercises[storedGame.game.currentExerciseNumber].correctAnswer;
}