import 'package:flutter/material.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/domain/game.dart' as domainGame;
import 'package:matematica_vera/domain/game_config.dart' as domainConfig;

class SelectGameData {
  final List<domainConfig.GameConfig> configs;
  final List<StoredLastDoneGame> lastDones;
  final List<domainGame.Game> games;

  SelectGameData({
    @required this.configs,
    @required this.lastDones,
    @required this.games
  });

  DateTime lastTimeGameDoneOrNull(String id) => lastDones
      .firstWhere((s) => s.id == id, orElse: () => null)
      ?.dateTime;

  bool isGameInProgress(String id) =>
      games.any((s) => s.id == id);
}
