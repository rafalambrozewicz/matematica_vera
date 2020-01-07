import 'package:matematica_vera/db/model/stored_game.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/game/game_builder.dart';

class SelectGameData {
  final List<StoredLastDoneGame> storeLastGameDone;
  final List<StoredGame> storeGames;

  SelectGameData({this.storeLastGameDone, this.storeGames});

  DateTime lastTimeGameDoneOrNull(GameTag gameTag) => storeLastGameDone
      .firstWhere((s) => s.gameTag == gameTag, orElse: () => null)
      ?.dateTime;

  bool isGameInProgress(GameTag gameTag) =>
      storeGames.any((s) => s.gameTag == gameTag);
}
