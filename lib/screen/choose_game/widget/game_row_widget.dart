import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/config/app_style.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/domain/game_config.dart';
import 'package:matematica_vera/screen/game/game_screen.dart';

class GameRowWidget extends StatelessWidget {
  static const _height = 88.0;
  static const _horizontalPadding = 16.0;

  final GameConfig gameConfig;
  final DateTime lastTimeDoneOrNull;
  final bool isInProgress;

  const GameRowWidget({
    Key key,
    @required this.gameConfig,
    @required this.lastTimeDoneOrNull,
    @required this.isInProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalization _loc = AppLocalization.of(context);

    return InkWell(
      onTap: () => pushScreen(context, GameScreen(config: gameConfig)),
      child: Container(
        color: gameConfig.color,
        height: _height,
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(gameConfig.title(_loc), style: AppStyle.listFirstLine,),
                _separator(),
                Text("${_loc.range} <${gameConfig.minNumber};${gameConfig.maxNumber}>, ${gameConfig.numberOfExercises} ${_loc.exercises}", style: AppStyle.listSecondaryLine),
                _separator(),
                Text(_getStatusRow(context), style: AppStyle.listSecondaryLine),
              ],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget _separator() => Container(height: 2.0);

  String _getStatusRow(BuildContext ctx) {
    final isInProgressText = _getIsInProgress(ctx, isInProgress);
    final lastTimeDoneText = _getLastTimeDone(ctx, lastTimeDoneOrNull);

    if (isInProgressText.isNotEmpty) {
      return "$isInProgressText, ${lastTimeDoneText.toLowerCase()}";
    } else {
      return lastTimeDoneText;
    }
  }

  String _getIsInProgress(BuildContext ctx, bool isInProgress) =>
      isInProgress ? AppLocalization.of(ctx).inProgress : "";

  String _getLastTimeDone(BuildContext ctx, DateTime lastTimeDoneOrNull) {
    if (lastTimeDoneOrNull == null) {
      return AppLocalization.of(ctx).neverDone;
    } else {
      final lastTimeDoneText = AppLocalization.of(ctx).lastDone;

      final dateTimeText = formatDate(
          lastTimeDoneOrNull.toLocal(),
          [yyyy, ".", mm, ".", dd, " ", HH, ":", nn]);

      return "$lastTimeDoneText $dateTimeText";
    }
  }
}
