import 'package:matematica_vera/db/core/db_config.dart';
import 'package:matematica_vera/game/game_builder.dart';
import 'package:moor/moor.dart';

class StoredLastDoneGame {
  final GameTag gameTag;
  final DateTime dateTime;

  StoredLastDoneGame.from(GameLastTimeDoneData entry):
      gameTag = GameTag.values.firstWhere((t) => t.toString() == entry.gameTag),
      dateTime = entry.lastTimeDone;

  GameLastTimeDoneCompanion toGameLastTimeDoneCompanion() =>
      GameLastTimeDoneCompanion(
        gameTag: Value(gameTag.toString()),
        lastTimeDone: Value(dateTime),
      );
}