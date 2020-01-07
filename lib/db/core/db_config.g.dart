// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_config.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GameLastTimeDoneData extends DataClass
    implements Insertable<GameLastTimeDoneData> {
  final String gameTag;
  final DateTime lastTimeDone;
  GameLastTimeDoneData({@required this.gameTag, @required this.lastTimeDone});
  factory GameLastTimeDoneData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return GameLastTimeDoneData(
      gameTag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}game_tag']),
      lastTimeDone: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_time_done']),
    );
  }
  factory GameLastTimeDoneData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GameLastTimeDoneData(
      gameTag: serializer.fromJson<String>(json['gameTag']),
      lastTimeDone: serializer.fromJson<DateTime>(json['lastTimeDone']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'gameTag': serializer.toJson<String>(gameTag),
      'lastTimeDone': serializer.toJson<DateTime>(lastTimeDone),
    };
  }

  @override
  GameLastTimeDoneCompanion createCompanion(bool nullToAbsent) {
    return GameLastTimeDoneCompanion(
      gameTag: gameTag == null && nullToAbsent
          ? const Value.absent()
          : Value(gameTag),
      lastTimeDone: lastTimeDone == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTimeDone),
    );
  }

  GameLastTimeDoneData copyWith({String gameTag, DateTime lastTimeDone}) =>
      GameLastTimeDoneData(
        gameTag: gameTag ?? this.gameTag,
        lastTimeDone: lastTimeDone ?? this.lastTimeDone,
      );
  @override
  String toString() {
    return (StringBuffer('GameLastTimeDoneData(')
          ..write('gameTag: $gameTag, ')
          ..write('lastTimeDone: $lastTimeDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(gameTag.hashCode, lastTimeDone.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameLastTimeDoneData &&
          other.gameTag == this.gameTag &&
          other.lastTimeDone == this.lastTimeDone);
}

class GameLastTimeDoneCompanion extends UpdateCompanion<GameLastTimeDoneData> {
  final Value<String> gameTag;
  final Value<DateTime> lastTimeDone;
  const GameLastTimeDoneCompanion({
    this.gameTag = const Value.absent(),
    this.lastTimeDone = const Value.absent(),
  });
  GameLastTimeDoneCompanion.insert({
    @required String gameTag,
    @required DateTime lastTimeDone,
  })  : gameTag = Value(gameTag),
        lastTimeDone = Value(lastTimeDone);
  GameLastTimeDoneCompanion copyWith(
      {Value<String> gameTag, Value<DateTime> lastTimeDone}) {
    return GameLastTimeDoneCompanion(
      gameTag: gameTag ?? this.gameTag,
      lastTimeDone: lastTimeDone ?? this.lastTimeDone,
    );
  }
}

class $GameLastTimeDoneTable extends GameLastTimeDone
    with TableInfo<$GameLastTimeDoneTable, GameLastTimeDoneData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameLastTimeDoneTable(this._db, [this._alias]);
  final VerificationMeta _gameTagMeta = const VerificationMeta('gameTag');
  GeneratedTextColumn _gameTag;
  @override
  GeneratedTextColumn get gameTag => _gameTag ??= _constructGameTag();
  GeneratedTextColumn _constructGameTag() {
    return GeneratedTextColumn(
      'game_tag',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastTimeDoneMeta =
      const VerificationMeta('lastTimeDone');
  GeneratedDateTimeColumn _lastTimeDone;
  @override
  GeneratedDateTimeColumn get lastTimeDone =>
      _lastTimeDone ??= _constructLastTimeDone();
  GeneratedDateTimeColumn _constructLastTimeDone() {
    return GeneratedDateTimeColumn(
      'last_time_done',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [gameTag, lastTimeDone];
  @override
  $GameLastTimeDoneTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'game_last_time_done';
  @override
  final String actualTableName = 'game_last_time_done';
  @override
  VerificationContext validateIntegrity(GameLastTimeDoneCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.gameTag.present) {
      context.handle(_gameTagMeta,
          gameTag.isAcceptableValue(d.gameTag.value, _gameTagMeta));
    } else if (gameTag.isRequired && isInserting) {
      context.missing(_gameTagMeta);
    }
    if (d.lastTimeDone.present) {
      context.handle(
          _lastTimeDoneMeta,
          lastTimeDone.isAcceptableValue(
              d.lastTimeDone.value, _lastTimeDoneMeta));
    } else if (lastTimeDone.isRequired && isInserting) {
      context.missing(_lastTimeDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameTag};
  @override
  GameLastTimeDoneData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameLastTimeDoneData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GameLastTimeDoneCompanion d) {
    final map = <String, Variable>{};
    if (d.gameTag.present) {
      map['game_tag'] = Variable<String, StringType>(d.gameTag.value);
    }
    if (d.lastTimeDone.present) {
      map['last_time_done'] =
          Variable<DateTime, DateTimeType>(d.lastTimeDone.value);
    }
    return map;
  }

  @override
  $GameLastTimeDoneTable createAlias(String alias) {
    return $GameLastTimeDoneTable(_db, alias);
  }
}

class GameData extends DataClass implements Insertable<GameData> {
  final String gameTag;
  final String gameJson;
  GameData({@required this.gameTag, @required this.gameJson});
  factory GameData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return GameData(
      gameTag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}game_tag']),
      gameJson: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}game_json']),
    );
  }
  factory GameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GameData(
      gameTag: serializer.fromJson<String>(json['gameTag']),
      gameJson: serializer.fromJson<String>(json['gameJson']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'gameTag': serializer.toJson<String>(gameTag),
      'gameJson': serializer.toJson<String>(gameJson),
    };
  }

  @override
  GameCompanion createCompanion(bool nullToAbsent) {
    return GameCompanion(
      gameTag: gameTag == null && nullToAbsent
          ? const Value.absent()
          : Value(gameTag),
      gameJson: gameJson == null && nullToAbsent
          ? const Value.absent()
          : Value(gameJson),
    );
  }

  GameData copyWith({String gameTag, String gameJson}) => GameData(
        gameTag: gameTag ?? this.gameTag,
        gameJson: gameJson ?? this.gameJson,
      );
  @override
  String toString() {
    return (StringBuffer('GameData(')
          ..write('gameTag: $gameTag, ')
          ..write('gameJson: $gameJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(gameTag.hashCode, gameJson.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameData &&
          other.gameTag == this.gameTag &&
          other.gameJson == this.gameJson);
}

class GameCompanion extends UpdateCompanion<GameData> {
  final Value<String> gameTag;
  final Value<String> gameJson;
  const GameCompanion({
    this.gameTag = const Value.absent(),
    this.gameJson = const Value.absent(),
  });
  GameCompanion.insert({
    @required String gameTag,
    @required String gameJson,
  })  : gameTag = Value(gameTag),
        gameJson = Value(gameJson);
  GameCompanion copyWith({Value<String> gameTag, Value<String> gameJson}) {
    return GameCompanion(
      gameTag: gameTag ?? this.gameTag,
      gameJson: gameJson ?? this.gameJson,
    );
  }
}

class $GameTable extends Game with TableInfo<$GameTable, GameData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameTable(this._db, [this._alias]);
  final VerificationMeta _gameTagMeta = const VerificationMeta('gameTag');
  GeneratedTextColumn _gameTag;
  @override
  GeneratedTextColumn get gameTag => _gameTag ??= _constructGameTag();
  GeneratedTextColumn _constructGameTag() {
    return GeneratedTextColumn(
      'game_tag',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gameJsonMeta = const VerificationMeta('gameJson');
  GeneratedTextColumn _gameJson;
  @override
  GeneratedTextColumn get gameJson => _gameJson ??= _constructGameJson();
  GeneratedTextColumn _constructGameJson() {
    return GeneratedTextColumn(
      'game_json',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [gameTag, gameJson];
  @override
  $GameTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'game';
  @override
  final String actualTableName = 'game';
  @override
  VerificationContext validateIntegrity(GameCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.gameTag.present) {
      context.handle(_gameTagMeta,
          gameTag.isAcceptableValue(d.gameTag.value, _gameTagMeta));
    } else if (gameTag.isRequired && isInserting) {
      context.missing(_gameTagMeta);
    }
    if (d.gameJson.present) {
      context.handle(_gameJsonMeta,
          gameJson.isAcceptableValue(d.gameJson.value, _gameJsonMeta));
    } else if (gameJson.isRequired && isInserting) {
      context.missing(_gameJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameTag};
  @override
  GameData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GameCompanion d) {
    final map = <String, Variable>{};
    if (d.gameTag.present) {
      map['game_tag'] = Variable<String, StringType>(d.gameTag.value);
    }
    if (d.gameJson.present) {
      map['game_json'] = Variable<String, StringType>(d.gameJson.value);
    }
    return map;
  }

  @override
  $GameTable createAlias(String alias) {
    return $GameTable(_db, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GameLastTimeDoneTable _gameLastTimeDone;
  $GameLastTimeDoneTable get gameLastTimeDone =>
      _gameLastTimeDone ??= $GameLastTimeDoneTable(this);
  $GameTable _game;
  $GameTable get game => _game ??= $GameTable(this);
  GameLastTimeDoneDao _gameLastTimeDoneDao;
  GameLastTimeDoneDao get gameLastTimeDoneDao =>
      _gameLastTimeDoneDao ??= GameLastTimeDoneDao(this as AppDb);
  GameDao _gameDao;
  GameDao get gameDao => _gameDao ??= GameDao(this as AppDb);
  @override
  List<TableInfo> get allTables => [gameLastTimeDone, game];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$GameLastTimeDoneDaoMixin on DatabaseAccessor<AppDb> {
  $GameLastTimeDoneTable get gameLastTimeDone => db.gameLastTimeDone;
}
mixin _$GameDaoMixin on DatabaseAccessor<AppDb> {
  $GameTable get game => db.game;
}
