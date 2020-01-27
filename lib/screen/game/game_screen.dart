import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/domain/game_config.dart';
import 'package:matematica_vera/screen/game/game_bloc.dart';
import 'package:matematica_vera/screen/game/game_bloc_events.dart';
import 'package:matematica_vera/screen/game/game_bloc_states.dart';
import 'package:matematica_vera/screen/game/widget/errors_count.dart';
import 'package:matematica_vera/screen/game/widget/exercise_done_widget.dart';
import 'package:matematica_vera/screen/game/widget/options_widget.dart';
import 'package:matematica_vera/screen/game/widget/progress_widget.dart';
import 'package:matematica_vera/screen/game/widget/riddle_text_widget.dart';
import 'package:matematica_vera/widget/loading_widget.dart';

class GameScreen extends StatefulWidget {
  final GameConfig config;

  const GameScreen({Key key, @required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  GameBloc _bloc;

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<GameBloc>(
        create: (_) {
          _bloc = GameBloc(widget.config)..add(Initialize());
          return _bloc;
        },
        child: BlocBuilder<GameBloc, GameBlocState>(
          builder: (BuildContext context, GameBlocState state) {
            Widget w;

            if (state is Loading) {
              w = LoadingWidget();
            } else if (state is DisplayExercise ||
                state is DisplayCorrectAnswer ||
                state is DisplayWrongAnswer) {
              w = _buildExerciseScreen(state);
            } else if (state is ExerciseFinished) {
              w = ExerciseDoneWidget(
                numberOfErrorOrNull: state.showErrors ? state.numberOfErrors : null,
                onBackTaped: () => popScreen(context),
                onRepeatTaped: () => _bloc.add(Initialize()),
              );
            }

            return Scaffold(
                appBar: AppBar(
                  title: Text(widget.config.longTitle(AppLocalization.of(context))),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: w);
          },
        ),
      );

  Widget _buildExerciseScreen(GameBlocState state) => Column(
        children: <Widget>[
          ProgressWidget(
            currentValue: state.currentExerciseNumber,
            maxValue: state.exerciseCount,
          ),
          Expanded(
            child: Stack(
              children: [
                state.showErrors ? ErrorsCount(
                  numberOfErrors: state.numberOfErrors,) : Container(),
                RiddleTextWidget(
                  text: state.exerciseText,
                  color: _determineTextColor(state),
                ),
              ]
            ),
          ),
          OptionsWidget(
              optionToHighlight: _determineValueToHighlight(state),
              color: _determineBackgroundColor(state),
              options: state.possibleAnswers,
              onOptionTap: _determineOnTapFunction(state)),
        ],
      );

  Color _determineTextColor(GameBlocState state) {
    if (state is DisplayCorrectAnswer) {
      return Colors.green;
    } else if (state is DisplayWrongAnswer) {
      return Colors.red;
    }

    return Colors.black;
  }

  Color _determineBackgroundColor(GameBlocState state) {
    if (state is DisplayCorrectAnswer) {
      return Colors.green;
    } else if (state is DisplayWrongAnswer) {
      return Colors.red;
    }

    return Colors.transparent;
  }

  String _determineValueToHighlight(GameBlocState state) {
    if (state is DisplayCorrectAnswer) {
      return state.correctAnswer;
    } else if (state is DisplayWrongAnswer) {
      return state.wrongAnswer;
    }

    return null;
  }

  Function _determineOnTapFunction(GameBlocState state) {
    if (state is DisplayCorrectAnswer) {
      return null;
    } else if (state is DisplayWrongAnswer) {
      return null;
    }

    return (String number) => _bloc.add(AnswerSelected(number));
  }
}
