import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/config/app_style.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/model/game.dart';
import 'package:matematica_vera/model/game_builder.dart';
import 'package:matematica_vera/model/game_type.dart';
import 'package:matematica_vera/screen/game/game_screen.dart';

class GameRowWidget extends StatelessWidget {
  static const _height = 88.0;
  static const _padding = 16.0;

  final GameConfig config;

  const GameRowWidget({Key key, @required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => pushScreen(context, GameScreen(game: Game.fromConfig(config),)),
    child: Container(
          height: _height,
          padding: EdgeInsets.symmetric(horizontal: _padding, vertical: _padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_getOperation(context, config), style: AppStyle.listFirstLine,),
                  Text("${AppLocalization.of(context).range} <0;${config.maxNumber}>, ${config.exerciseCount} ${AppLocalization.of(context).exercises}", style: AppStyle.listSecondaryLine),
                  Text("${AppLocalization.of(context).never_done}", style: AppStyle.listSecondaryLine),
                ],
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
  );

  String _getOperation(BuildContext ctx, GameConfig config) {
    switch (config.type) {
      case GameType.addition:
        return AppLocalization.of(ctx).addition;

      case GameType.subtraction:
        return AppLocalization.of(ctx).subtraction;
    }

  }
}
