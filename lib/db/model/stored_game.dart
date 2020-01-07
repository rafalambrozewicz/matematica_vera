import 'dart:convert';

import 'package:matematica_vera/db/core/db_config.dart' as db;
import 'package:matematica_vera/game/game.dart';
import 'package:matematica_vera/game/game_builder.dart';
import 'package:moor/moor.dart';

class StoredGame {
  final GameTag gameTag;
  final Game game;

  StoredGame.from(db.GameData entry):
        gameTag = GameTag.values.firstWhere((t) => t.toString() == entry.gameTag),
        game = Game.fromJson(json.decode(entry.gameJson));

  db.GameCompanion toGameCompanion() => db.GameCompanion(
    gameTag: Value(gameTag.toString()),
    gameJson: Value(json.encode(game.toJson())),
  );
}