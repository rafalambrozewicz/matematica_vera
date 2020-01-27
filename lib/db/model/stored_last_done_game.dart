import 'package:matematica_vera/db/core/db_config.dart';
import 'package:moor/moor.dart';

class StoredLastDoneGame {
  final String id;
  final DateTime dateTime;

  StoredLastDoneGame({
    this.id,
    this.dateTime
  });

  StoredLastDoneGame.from(GameLastTimeDoneData entry):
      id = entry.id,
      dateTime = entry.lastTimeDone;

  GameLastTimeDoneCompanion toGameLastTimeDoneCompanion() =>
      GameLastTimeDoneCompanion(
        id: Value(id),
        lastTimeDone: Value(dateTime),
      );
}