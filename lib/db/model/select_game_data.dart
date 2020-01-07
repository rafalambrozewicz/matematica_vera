import 'package:flutter/material.dart';
import 'package:matematica_vera/db/model/stored_game.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/game/game_builder.dart';

class SelectGameData {
  final List<StoredLastDoneGame> storeLastGameDones;
  final List<StoredGame> storeGames;

  SelectGameData({@required this.storeLastGameDones, @required this.storeGames});

  DateTime lastTimeGameDoneOrNull(GameTag gameTag) => storeLastGameDones
      .firstWhere((s) => s.gameTag == gameTag, orElse: () => null)
      ?.dateTime;

  bool isGameInProgress(GameTag gameTag) =>
      storeGames.any((s) => s.gameTag == gameTag);
}
