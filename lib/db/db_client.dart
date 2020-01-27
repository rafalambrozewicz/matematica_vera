import 'package:matematica_vera/db/core/db_config.dart';
import 'package:matematica_vera/db/model/select_game_data.dart';
import 'package:matematica_vera/db/model/stored_last_done_game.dart';
import 'package:matematica_vera/domain/game_config.dart' as domainConfig;
import 'package:matematica_vera/domain/game.dart' as domainGame;
import 'package:rxdart/streams.dart';
import 'package:rxdart/transformers.dart';

class DbClient {
  final _db = AppDb();

  Stream<SelectGameData> watchSelectGameData() {
    final gameConfigs = _db.gameConfigDao.watchAll();
    final lastDoneGames = _db.gameLastTimeDoneDao.watchAll();
    final games = _db.gameDao.watchAll();

    return CombineLatestStream.combine3(
        gameConfigs,
        lastDoneGames,
        games,
            (List<GameConfigData> gcd,
            List<GameLastTimeDoneData> ldg,
            List<GameData> g) => SelectGameData(
                configs: gcd.map((e) =>
                    domainConfig.GameConfig.fromGameConfigData(e)).toList(),
                lastDones: ldg.map((e) =>
                    StoredLastDoneGame.from(e)).toList(),
                games: g.map((e) =>
                    domainGame.Game.fromGameData(e)).toList()))
    .debounceTime(Duration(milliseconds: 100));
  }
  Future<void> insertGameConfig(domainConfig.GameConfig entry) async =>
      await _db.gameConfigDao.insert(entry.toGameConfigCompanion());

  Future<void> removeGameConfig(String id) async {
    await _db.gameConfigDao.removeById(id);
    await _db.gameDao.removeById(id);
    await _db.gameLastTimeDoneDao.removeById(id);
  }

  Future<void> insertStoredLastDoneGame(StoredLastDoneGame entry) async =>
      await _db.gameLastTimeDoneDao.insert(entry.toGameLastTimeDoneCompanion());

  Future<void> insertGame(domainGame.Game entry) async =>
      await _db.gameDao.insert(entry.toGameCompanion());

  Future<void> removeGame(String id) async =>
      await _db.gameDao.removeById(id);

  Future<domainGame.Game> getGameOrNull(String id) async {
    final dbGame = await _db.gameDao.getById(id);
    return dbGame != null ? domainGame.Game.fromGameData(dbGame) : null;
  }
}

final dbClient = DbClient();