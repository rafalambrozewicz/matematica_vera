import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db_config.g.dart';

class GameLastTimeDone extends Table {
  get primaryKey => { gameTag };

  TextColumn get gameTag => text()();
  DateTimeColumn get lastTimeDone => dateTime()();
}

@UseDao(tables: [GameLastTimeDone])
class GameLastTimeDoneDao extends DatabaseAccessor<AppDb> with _$GameLastTimeDoneDaoMixin {

  GameLastTimeDoneDao(AppDb db) : super(db);

  Stream<List<GameLastTimeDoneData>> watchAll() =>
      select(gameLastTimeDone).watch();
}

class Game extends Table {
  get primaryKey => { gameTag };

  TextColumn get gameTag => text()();
  TextColumn get gameJson => text()();
}

@UseDao(tables: [Game])
class GameDao extends DatabaseAccessor<AppDb> with _$GameDaoMixin {

  GameDao(AppDb db) : super(db);

  Stream<List<GameData>> watchAll() =>
      select(game).watch();
}

@UseMoor(
    tables: [GameLastTimeDone, Game],
    daos: [GameLastTimeDoneDao, GameDao])
class AppDb extends _$AppDb {

  @override
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
 }

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}



