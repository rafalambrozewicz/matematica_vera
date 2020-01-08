import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/game/game.dart';
import 'package:matematica_vera/game/game_config.dart';
import 'package:matematica_vera/game/game_type.dart';
import 'package:matematica_vera/screen/game/game_bloc.dart';
import 'package:matematica_vera/screen/game/game_bloc_events.dart';
import 'package:matematica_vera/screen/game/game_bloc_states.dart';
import 'package:matematica_vera/screen/game/widget/options_widget.dart';
import 'package:matematica_vera/screen/game/widget/progress_widget.dart';
import 'package:matematica_vera/widget/loading_widget.dart';

class GameScreen extends StatefulWidget {
  final GameConfig config;

  const GameScreen({Key key, @required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentExerciseNumber = 0;

  GameBloc _bloc;

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider<GameBloc>(
      create: (_) {
        _bloc = GameBloc(widget.config);
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
            w = _buildBackOrReplaySection();
          }

          return Scaffold(
              appBar: AppBar(
                title: Text(_genGameName(context, widget.config)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              body: w);
        },
      ),
    );
  }

  Widget _buildExerciseScreen(GameBlocState state) =>
      Column(
        children: <Widget>[
          ProgressWidget(
            currentValue: state.currentExerciseNumber,
            maxValue: state.exerciseCount,
          ),
          Expanded(
            child: Center(
              child: Text(
                state.exerciseText,
                style: TextStyle(
                  fontSize: 72.0,
                ),
              ),
            ),
          ),
          OptionsWidget(
              options:
              state.possibleAnswers,
              onOptionTap: (String number) => _bloc.add(AnswerSelected(number))
          ),
        ],
      );

  String _genGameName(BuildContext ctx, GameConfig config) {
    String operation;
    switch (config.type) {
      case GameType.addition:
        operation = AppLocalization
            .of(ctx)
            .addition;
        break;
      case GameType.subtraction:
        operation = AppLocalization
            .of(ctx)
            .subtraction;
        break;
    }

    return "$operation, <0;${config.maxNumber}>";
  }

  Widget _buildBackOrReplaySection() => Placeholder();
}
