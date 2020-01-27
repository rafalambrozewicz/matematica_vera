import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:matematica_vera/domain/game_config.dart' as domainConfig;

part 'db_config.g.dart';

class GameConfig extends Table {
  get primaryKey => { id };

  TextColumn get id => text()();
  TextColumn get customName => text().nullable()();
  IntColumn get color => integer()();
  TextColumn get operationType => text()();
  IntColumn get minNumber => integer()();
  IntColumn get maxNumber => integer()();
  IntColumn get maxResult => integer()();
  IntColumn get numberOfExercises => integer()();
  IntColumn get numberOfAnswers => integer()();
  BoolColumn get showErrorsCount => boolean()();
}

@UseDao(tables: [GameConfig])
class GameConfigDao extends DatabaseAccessor<AppDb> with _$GameConfigDaoMixin {

  GameConfigDao(AppDb db) : super(db);

  Stream<List<GameConfigData>> watchAll() =>
      select(gameConfig).watch();

  Future<void> insert(GameConfigCompanion c) =>
      into(gameConfig).insert(c);

  Future<void> removeById(String id) =>
      (delete(gameConfig)..where((gc) => gc.id.equals(id))).go();
}

class GameLastTimeDone extends Table {
  get primaryKey => { id };

  TextColumn get id => text()();
  DateTimeColumn get lastTimeDone => dateTime()();
}

@UseDao(tables: [GameLastTimeDone])
class GameLastTimeDoneDao extends DatabaseAccessor<AppDb> with _$GameLastTimeDoneDaoMixin {

  GameLastTimeDoneDao(AppDb db) : super(db);

  Stream<List<GameLastTimeDoneData>> watchAll() =>
      select(gameLastTimeDone).watch();

  Future<void> removeById(String id) =>
      (delete(gameLastTimeDone)..where((e) => e.id.equals(id))).go();

  Future<void> insert(GameLastTimeDoneCompanion c) async =>
      await into(gameLastTimeDone).insert(c, orReplace: true);
}

class Game extends Table {
  get primaryKey => { id };

  TextColumn get id => text()();
  TextColumn get gameJson => text()();
}

@UseDao(tables: [Game])
class GameDao extends DatabaseAccessor<AppDb> with _$GameDaoMixin {

  GameDao(AppDb db) : super(db);

  Stream<List<GameData>> watchAll() =>
      select(game).watch();

  Future<GameData> getById(String id) =>
      (select(game)..where((e) => e.id.equals(id)))
          .getSingle();

  Future<void> removeById(String id) =>
      (delete(game)..where((e) => e.id.equals(id))).go();

  Future<void> insert(GameCompanion c) async =>
      await into(game).insert(c, orReplace: true);
}

@UseMoor(
    tables: [GameConfig, GameLastTimeDone, Game],
    daos: [GameConfigDao, GameLastTimeDoneDao, GameDao])
class AppDb extends _$AppDb {

  @override
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAllTables();
        domainConfig.defaultGameConfigs
            .map((c) => c.toGameConfigCompanion()).toList()
            .forEach((c) async => await _gameConfigDao.insert(c));
      },
  );
 }

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}