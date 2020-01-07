import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/game/game.dart';
import 'package:matematica_vera/game/game_config.dart';
import 'package:matematica_vera/game/game_type.dart';
import 'package:matematica_vera/screen/game/widget/options_widget.dart';
import 'package:matematica_vera/screen/game/widget/progress_widget.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({Key key, @required this.game}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentExerciseNumber = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_genGameName(context, widget.game.config)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            ProgressWidget(
              currentValue: currentExerciseNumber,
              maxValue: widget.game.config.exerciseCount,
            ),
            Expanded(
              child: Center(
                child: Text(
                    widget.game.exercises[currentExerciseNumber].riddleObscured,
                style: TextStyle(
                  fontSize: 72.0,
                ),),
              ),
            ),
            OptionsWidget(
              options:
                  widget.game.exercises[currentExerciseNumber].possibleAnswers,
              onOptionTap: (String number) {
                if (number ==
                    widget
                        .game.exercises[currentExerciseNumber].correctAnswer) {
                  setState(() {
                    currentExerciseNumber += 1;
                  });
                }
              },
            ),
          ],
        ),
      );

  String _genGameName(BuildContext ctx, GameConfig config) {
    String operation;
    switch (config.type) {
      case GameType.addition:
        operation = AppLocalization.of(ctx).addition;
        break;
      case GameType.subtraction:
        operation = AppLocalization.of(ctx).subtraction;
        break;
    }

    return "${operation}, <0;${config.maxNumber}>";
  }
}
