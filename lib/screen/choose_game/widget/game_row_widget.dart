import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/config/app_style.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/game/game_builder.dart';
import 'package:matematica_vera/game/game_config.dart';
import 'package:matematica_vera/game/game_type.dart';
import 'package:matematica_vera/screen/game/game_screen.dart';

class GameRowWidget extends StatelessWidget {
  static const _height = 88.0;
  static const _padding = 16.0;

  final GameTag gameTag;
  final DateTime lastTimeDoneOrNull;
  final bool isInProgress;

  const GameRowWidget({
    Key key,
    @required this.gameTag,
    @required this.lastTimeDoneOrNull,
    @required this.isInProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = GameConfigBuilder.forTag(gameTag);

    return InkWell(
      onTap: () => pushScreen(context, GameScreen(config: config)),
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
                Text(_getStatusRow(context), style: AppStyle.listSecondaryLine),
              ],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  String _getOperation(BuildContext ctx, GameConfig config) {
    switch (config.type) {
      case GameType.addition:
        return AppLocalization.of(ctx).addition;

      case GameType.subtraction:
        return AppLocalization.of(ctx).subtraction;
    }
  }

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
      isInProgress ? AppLocalization.of(ctx).in_progress : "";

  String _getLastTimeDone(BuildContext ctx, DateTime lastTimeDoneOrNull) {
    if (lastTimeDoneOrNull == null) {
      return AppLocalization.of(ctx).never_done;
    } else {
      final lastTimeDoneText = AppLocalization.of(ctx).last_done;

      final dateTimeText = formatDate(
          lastTimeDoneOrNull.toLocal(),
          [yyyy, ".", mm, ".", dd, " ", HH, ":", nn]);

      return "$lastTimeDoneText $dateTimeText";
    }
  }
}
