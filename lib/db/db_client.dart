import 'package:matematica_vera/db/core/db_config.dart';
import 'package:matematica_vera/db/model/select_game_data.dart';
import 'package:matematica_vera/db/model/stored_game.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/transformers.dart';

class DbClient {
  final _db = AppDb();

  Stream<SelectGameData> watchSelectGameData() {
    final lastDoneGames = _db.gameLastTimeDoneDao.watchAll();
    final games = _db.gameDao.watchAll();

    return CombineLatestStream.combine2(
        lastDoneGames,
        games,
        (List<GameLastTimeDoneData> ldg, List<GameData> g) => SelectGameData(
            storeLastGameDones:
                ldg.map((e) => StoredLastDoneGame.from(e)).toList(),
            storeGames: g.map((e) => StoredGame.from(e)).toList()))
    .debounceTime(Duration(milliseconds: 100));
  }

  Future<void> insertStoredLastDoneGame(StoredLastDoneGame entry) async =>
      await _db.gameLastTimeDoneDao.insert(entry.toGameLastTimeDoneCompanion());

  Future<void> insertStoredGame(StoredGame entry) async =>
      await _db.gameDao.insert(entry.toGameCompanion());
}

final dbClient = DbClient();
