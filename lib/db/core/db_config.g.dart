// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_config.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GameConfigData extends DataClass implements Insertable<GameConfigData> {
  final String id;
  final String customName;
  final int color;
  final String operationType;
  final int minNumber;
  final int maxNumber;
  final int maxResult;
  final int numberOfExercises;
  final int numberOfAnswers;
  final bool showErrorsCount;
  GameConfigData(
      {@required this.id,
      this.customName,
      @required this.color,
      @required this.operationType,
      @required this.minNumber,
      @required this.maxNumber,
      @required this.maxResult,
      @required this.numberOfExercises,
      @required this.numberOfAnswers,
      @required this.showErrorsCount});
  factory GameConfigData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return GameConfigData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      customName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}custom_name']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      operationType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}operation_type']),
      minNumber:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}min_number']),
      maxNumber:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}max_number']),
      maxResult:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}max_result']),
      numberOfExercises: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}number_of_exercises']),
      numberOfAnswers: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}number_of_answers']),
      showErrorsCount: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}show_errors_count']),
    );
  }
  factory GameConfigData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GameConfigData(
      id: serializer.fromJson<String>(json['id']),
      customName: serializer.fromJson<String>(json['customName']),
      color: serializer.fromJson<int>(json['color']),
      operationType: serializer.fromJson<String>(json['operationType']),
      minNumber: serializer.fromJson<int>(json['minNumber']),
      maxNumber: serializer.fromJson<int>(json['maxNumber']),
      maxResult: serializer.fromJson<int>(json['maxResult']),
      numberOfExercises: serializer.fromJson<int>(json['numberOfExercises']),
      numberOfAnswers: serializer.fromJson<int>(json['numberOfAnswers']),
      showErrorsCount: serializer.fromJson<bool>(json['showErrorsCount']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'customName': serializer.toJson<String>(customName),
      'color': serializer.toJson<int>(color),
      'operationType': serializer.toJson<String>(operationType),
      'minNumber': serializer.toJson<int>(minNumber),
      'maxNumber': serializer.toJson<int>(maxNumber),
      'maxResult': serializer.toJson<int>(maxResult),
      'numberOfExercises': serializer.toJson<int>(numberOfExercises),
      'numberOfAnswers': serializer.toJson<int>(numberOfAnswers),
      'showErrorsCount': serializer.toJson<bool>(showErrorsCount),
    };
  }

  @override
  GameConfigCompanion createCompanion(bool nullToAbsent) {
    return GameConfigCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      customName: customName == null && nullToAbsent
          ? const Value.absent()
          : Value(customName),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      operationType: operationType == null && nullToAbsent
          ? const Value.absent()
          : Value(operationType),
      minNumber: minNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(minNumber),
      maxNumber: maxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(maxNumber),
      maxResult: maxResult == null && nullToAbsent
          ? const Value.absent()
          : Value(maxResult),
      numberOfExercises: numberOfExercises == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfExercises),
      numberOfAnswers: numberOfAnswers == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfAnswers),
      showErrorsCount: showErrorsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(showErrorsCount),
    );
  }

  GameConfigData copyWith(
          {String id,
          String customName,
          int color,
          String operationType,
          int minNumber,
          int maxNumber,
          int maxResult,
          int numberOfExercises,
          int numberOfAnswers,
          bool showErrorsCount}) =>
      GameConfigData(
        id: id ?? this.id,
        customName: customName ?? this.customName,
        color: color ?? this.color,
        operationType: operationType ?? this.operationType,
        minNumber: minNumber ?? this.minNumber,
        maxNumber: maxNumber ?? this.maxNumber,
        maxResult: maxResult ?? this.maxResult,
        numberOfExercises: numberOfExercises ?? this.numberOfExercises,
        numberOfAnswers: numberOfAnswers ?? this.numberOfAnswers,
        showErrorsCount: showErrorsCount ?? this.showErrorsCount,
      );
  @override
  String toString() {
    return (StringBuffer('GameConfigData(')
          ..write('id: $id, ')
          ..write('customName: $customName, ')
          ..write('color: $color, ')
          ..write('operationType: $operationType, ')
          ..write('minNumber: $minNumber, ')
          ..write('maxNumber: $maxNumber, ')
          ..write('maxResult: $maxResult, ')
          ..write('numberOfExercises: $numberOfExercises, ')
          ..write('numberOfAnswers: $numberOfAnswers, ')
          ..write('showErrorsCount: $showErrorsCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          customName.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(
                  operationType.hashCode,
                  $mrjc(
                      minNumber.hashCode,
                      $mrjc(
                          maxNumber.hashCode,
                          $mrjc(
                              maxResult.hashCode,
                              $mrjc(
                                  numberOfExercises.hashCode,
                                  $mrjc(numberOfAnswers.hashCode,
                                      showErrorsCount.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameConfigData &&
          other.id == this.id &&
          other.customName == this.customName &&
          other.color == this.color &&
          other.operationType == this.operationType &&
          other.minNumber == this.minNumber &&
          other.maxNumber == this.maxNumber &&
          other.maxResult == this.maxResult &&
          other.numberOfExercises == this.numberOfExercises &&
          other.numberOfAnswers == this.numberOfAnswers &&
          other.showErrorsCount == this.showErrorsCount);
}

class GameConfigCompanion extends UpdateCompanion<GameConfigData> {
  final Value<String> id;
  final Value<String> customName;
  final Value<int> color;
  final Value<String> operationType;
  final Value<int> minNumber;
  final Value<int> maxNumber;
  final Value<int> maxResult;
  final Value<int> numberOfExercises;
  final Value<int> numberOfAnswers;
  final Value<bool> showErrorsCount;
  const GameConfigCompanion({
    this.id = const Value.absent(),
    this.customName = const Value.absent(),
    this.color = const Value.absent(),
    this.operationType = const Value.absent(),
    this.minNumber = const Value.absent(),
    this.maxNumber = const Value.absent(),
    this.maxResult = const Value.absent(),
    this.numberOfExercises = const Value.absent(),
    this.numberOfAnswers = const Value.absent(),
    this.showErrorsCount = const Value.absent(),
  });
  GameConfigCompanion.insert({
    @required String id,
    this.customName = const Value.absent(),
    @required int color,
    @required String operationType,
    @required int minNumber,
    @required int maxNumber,
    @required int maxResult,
    @required int numberOfExercises,
    @required int numberOfAnswers,
    @required bool showErrorsCount,
  })  : id = Value(id),
        color = Value(color),
        operationType = Value(operationType),
        minNumber = Value(minNumber),
        maxNumber = Value(maxNumber),
        maxResult = Value(maxResult),
        numberOfExercises = Value(numberOfExercises),
        numberOfAnswers = Value(numberOfAnswers),
        showErrorsCount = Value(showErrorsCount);
  GameConfigCompanion copyWith(
      {Value<String> id,
      Value<String> customName,
      Value<int> color,
      Value<String> operationType,
      Value<int> minNumber,
      Value<int> maxNumber,
      Value<int> maxResult,
      Value<int> numberOfExercises,
      Value<int> numberOfAnswers,
      Value<bool> showErrorsCount}) {
    return GameConfigCompanion(
      id: id ?? this.id,
      customName: customName ?? this.customName,
      color: color ?? this.color,
      operationType: operationType ?? this.operationType,
      minNumber: minNumber ?? this.minNumber,
      maxNumber: maxNumber ?? this.maxNumber,
      maxResult: maxResult ?? this.maxResult,
      numberOfExercises: numberOfExercises ?? this.numberOfExercises,
      numberOfAnswers: numberOfAnswers ?? this.numberOfAnswers,
      showErrorsCount: showErrorsCount ?? this.showErrorsCount,
    );
  }
}

class $GameConfigTable extends GameConfig
    with TableInfo<$GameConfigTable, GameConfigData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameConfigTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _customNameMeta = const VerificationMeta('customName');
  GeneratedTextColumn _customName;
  @override
  GeneratedTextColumn get customName => _customName ??= _constructCustomName();
  GeneratedTextColumn _constructCustomName() {
    return GeneratedTextColumn(
      'custom_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  GeneratedTextColumn _operationType;
  @override
  GeneratedTextColumn get operationType =>
      _operationType ??= _constructOperationType();
  GeneratedTextColumn _constructOperationType() {
    return GeneratedTextColumn(
      'operation_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _minNumberMeta = const VerificationMeta('minNumber');
  GeneratedIntColumn _minNumber;
  @override
  GeneratedIntColumn get minNumber => _minNumber ??= _constructMinNumber();
  GeneratedIntColumn _constructMinNumber() {
    return GeneratedIntColumn(
      'min_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxNumberMeta = const VerificationMeta('maxNumber');
  GeneratedIntColumn _maxNumber;
  @override
  GeneratedIntColumn get maxNumber => _maxNumber ??= _constructMaxNumber();
  GeneratedIntColumn _constructMaxNumber() {
    return GeneratedIntColumn(
      'max_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxResultMeta = const VerificationMeta('maxResult');
  GeneratedIntColumn _maxResult;
  @override
  GeneratedIntColumn get maxResult => _maxResult ??= _constructMaxResult();
  GeneratedIntColumn _constructMaxResult() {
    return GeneratedIntColumn(
      'max_result',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberOfExercisesMeta =
      const VerificationMeta('numberOfExercises');
  GeneratedIntColumn _numberOfExercises;
  @override
  GeneratedIntColumn get numberOfExercises =>
      _numberOfExercises ??= _constructNumberOfExercises();
  GeneratedIntColumn _constructNumberOfExercises() {
    return GeneratedIntColumn(
      'number_of_exercises',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberOfAnswersMeta =
      const VerificationMeta('numberOfAnswers');
  GeneratedIntColumn _numberOfAnswers;
  @override
  GeneratedIntColumn get numberOfAnswers =>
      _numberOfAnswers ??= _constructNumberOfAnswers();
  GeneratedIntColumn _constructNumberOfAnswers() {
    return GeneratedIntColumn(
      'number_of_answers',
      $tableName,
      false,
    );
  }

  final VerificationMeta _showErrorsCountMeta =
      const VerificationMeta('showErrorsCount');
  GeneratedBoolColumn _showErrorsCount;
  @override
  GeneratedBoolColumn get showErrorsCount =>
      _showErrorsCount ??= _constructShowErrorsCount();
  GeneratedBoolColumn _constructShowErrorsCount() {
    return GeneratedBoolColumn(
      'show_errors_count',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        customName,
        color,
        operationType,
        minNumber,
        maxNumber,
        maxResult,
        numberOfExercises,
        numberOfAnswers,
        showErrorsCount
      ];
  @override
  $GameConfigTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'game_config';
  @override
  final String actualTableName = 'game_config';
  @override
  VerificationContext validateIntegrity(GameConfigCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.customName.present) {
      context.handle(_customNameMeta,
          customName.isAcceptableValue(d.customName.value, _customNameMeta));
    } else if (customName.isRequired && isInserting) {
      context.missing(_customNameMeta);
    }
    if (d.color.present) {
      context.handle(
          _colorMeta, color.isAcceptableValue(d.color.value, _colorMeta));
    } else if (color.isRequired && isInserting) {
      context.missing(_colorMeta);
    }
    if (d.operationType.present) {
      context.handle(
          _operationTypeMeta,
          operationType.isAcceptableValue(
              d.operationType.value, _operationTypeMeta));
    } else if (operationType.isRequired && isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (d.minNumber.present) {
      context.handle(_minNumberMeta,
          minNumber.isAcceptableValue(d.minNumber.value, _minNumberMeta));
    } else if (minNumber.isRequired && isInserting) {
      context.missing(_minNumberMeta);
    }
    if (d.maxNumber.present) {
      context.handle(_maxNumberMeta,
          maxNumber.isAcceptableValue(d.maxNumber.value, _maxNumberMeta));
    } else if (maxNumber.isRequired && isInserting) {
      context.missing(_maxNumberMeta);
    }
    if (d.maxResult.present) {
      context.handle(_maxResultMeta,
          maxResult.isAcceptableValue(d.maxResult.value, _maxResultMeta));
    } else if (maxResult.isRequired && isInserting) {
      context.missing(_maxResultMeta);
    }
    if (d.numberOfExercises.present) {
      context.handle(
          _numberOfExercisesMeta,
          numberOfExercises.isAcceptableValue(
              d.numberOfExercises.value, _numberOfExercisesMeta));
    } else if (numberOfExercises.isRequired && isInserting) {
      context.missing(_numberOfExercisesMeta);
    }
    if (d.numberOfAnswers.present) {
      context.handle(
          _numberOfAnswersMeta,
          numberOfAnswers.isAcceptableValue(
              d.numberOfAnswers.value, _numberOfAnswersMeta));
    } else if (numberOfAnswers.isRequired && isInserting) {
      context.missing(_numberOfAnswersMeta);
    }
    if (d.showErrorsCount.present) {
      context.handle(
          _showErrorsCountMeta,
          showErrorsCount.isAcceptableValue(
              d.showErrorsCount.value, _showErrorsCountMeta));
    } else if (showErrorsCount.isRequired && isInserting) {
      context.missing(_showErrorsCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameConfigData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameConfigData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GameConfigCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.customName.present) {
      map['custom_name'] = Variable<String, StringType>(d.customName.value);
    }
    if (d.color.present) {
      map['color'] = Variable<int, IntType>(d.color.value);
    }
    if (d.operationType.present) {
      map['operation_type'] =
          Variable<String, StringType>(d.operationType.value);
    }
    if (d.minNumber.present) {
      map['min_number'] = Variable<int, IntType>(d.minNumber.value);
    }
    if (d.maxNumber.present) {
      map['max_number'] = Variable<int, IntType>(d.maxNumber.value);
    }
    if (d.maxResult.present) {
      map['max_result'] = Variable<int, IntType>(d.maxResult.value);
    }
    if (d.numberOfExercises.present) {
      map['number_of_exercises'] =
          Variable<int, IntType>(d.numberOfExercises.value);
    }
    if (d.numberOfAnswers.present) {
      map['number_of_answers'] =
          Variable<int, IntType>(d.numberOfAnswers.value);
    }
    if (d.showErrorsCount.present) {
      map['show_errors_count'] =
          Variable<bool, BoolType>(d.showErrorsCount.value);
    }
    return map;
  }

  @override
  $GameConfigTable createAlias(String alias) {
    return $GameConfigTable(_db, alias);
  }
}

class GameLastTimeDoneData extends DataClass
    implements Insertable<GameLastTimeDoneData> {
  final String id;
  final DateTime lastTimeDone;
  GameLastTimeDoneData({@required this.id, @required this.lastTimeDone});
  factory GameLastTimeDoneData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return GameLastTimeDoneData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      lastTimeDone: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_time_done']),
    );
  }
  factory GameLastTimeDoneData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GameLastTimeDoneData(
      id: serializer.fromJson<String>(json['id']),
      lastTimeDone: serializer.fromJson<DateTime>(json['lastTimeDone']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lastTimeDone': serializer.toJson<DateTime>(lastTimeDone),
    };
  }

  @override
  GameLastTimeDoneCompanion createCompanion(bool nullToAbsent) {
    return GameLastTimeDoneCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lastTimeDone: lastTimeDone == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTimeDone),
    );
  }

  GameLastTimeDoneData copyWith({String id, DateTime lastTimeDone}) =>
      GameLastTimeDoneData(
        id: id ?? this.id,
        lastTimeDone: lastTimeDone ?? this.lastTimeDone,
      );
  @override
  String toString() {
    return (StringBuffer('GameLastTimeDoneData(')
          ..write('id: $id, ')
          ..write('lastTimeDone: $lastTimeDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, lastTimeDone.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameLastTimeDoneData &&
          other.id == this.id &&
          other.lastTimeDone == this.lastTimeDone);
}

class GameLastTimeDoneCompanion extends UpdateCompanion<GameLastTimeDoneData> {
  final Value<String> id;
  final Value<DateTime> lastTimeDone;
  const GameLastTimeDoneCompanion({
    this.id = const Value.absent(),
    this.lastTimeDone = const Value.absent(),
  });
  GameLastTimeDoneCompanion.insert({
    @required String id,
    @required DateTime lastTimeDone,
  })  : id = Value(id),
        lastTimeDone = Value(lastTimeDone);
  GameLastTimeDoneCompanion copyWith(
      {Value<String> id, Value<DateTime> lastTimeDone}) {
    return GameLastTimeDoneCompanion(
      id: id ?? this.id,
      lastTimeDone: lastTimeDone ?? this.lastTimeDone,
    );
  }
}

class $GameLastTimeDoneTable extends GameLastTimeDone
    with TableInfo<$GameLastTimeDoneTable, GameLastTimeDoneData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameLastTimeDoneTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
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
  List<GeneratedColumn> get $columns => [id, lastTimeDone];
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
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameLastTimeDoneData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameLastTimeDoneData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GameLastTimeDoneCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
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
  final String id;
  final String gameJson;
  GameData({@required this.id, @required this.gameJson});
  factory GameData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return GameData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      gameJson: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}game_json']),
    );
  }
  factory GameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return GameData(
      id: serializer.fromJson<String>(json['id']),
      gameJson: serializer.fromJson<String>(json['gameJson']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'gameJson': serializer.toJson<String>(gameJson),
    };
  }

  @override
  GameCompanion createCompanion(bool nullToAbsent) {
    return GameCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      gameJson: gameJson == null && nullToAbsent
          ? const Value.absent()
          : Value(gameJson),
    );
  }

  GameData copyWith({String id, String gameJson}) => GameData(
        id: id ?? this.id,
        gameJson: gameJson ?? this.gameJson,
      );
  @override
  String toString() {
    return (StringBuffer('GameData(')
          ..write('id: $id, ')
          ..write('gameJson: $gameJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, gameJson.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameData &&
          other.id == this.id &&
          other.gameJson == this.gameJson);
}

class GameCompanion extends UpdateCompanion<GameData> {
  final Value<String> id;
  final Value<String> gameJson;
  const GameCompanion({
    this.id = const Value.absent(),
    this.gameJson = const Value.absent(),
  });
  GameCompanion.insert({
    @required String id,
    @required String gameJson,
  })  : id = Value(id),
        gameJson = Value(gameJson);
  GameCompanion copyWith({Value<String> id, Value<String> gameJson}) {
    return GameCompanion(
      id: id ?? this.id,
      gameJson: gameJson ?? this.gameJson,
    );
  }
}

class $GameTable extends Game with TableInfo<$GameTable, GameData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
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
  List<GeneratedColumn> get $columns => [id, gameJson];
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
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GameCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
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
  $GameConfigTable _gameConfig;
  $GameConfigTable get gameConfig => _gameConfig ??= $GameConfigTable(this);
  $GameLastTimeDoneTable _gameLastTimeDone;
  $GameLastTimeDoneTable get gameLastTimeDone =>
      _gameLastTimeDone ??= $GameLastTimeDoneTable(this);
  $GameTable _game;
  $GameTable get game => _game ??= $GameTable(this);
  GameConfigDao _gameConfigDao;
  GameConfigDao get gameConfigDao =>
      _gameConfigDao ??= GameConfigDao(this as AppDb);
  GameLastTimeDoneDao _gameLastTimeDoneDao;
  GameLastTimeDoneDao get gameLastTimeDoneDao =>
      _gameLastTimeDoneDao ??= GameLastTimeDoneDao(this as AppDb);
  GameDao _gameDao;
  GameDao get gameDao => _gameDao ??= GameDao(this as AppDb);
  @override
  List<TableInfo> get allTables => [gameConfig, gameLastTimeDone, game];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$GameConfigDaoMixin on DatabaseAccessor<AppDb> {
  $GameConfigTable get gameConfig => db.gameConfig;
}
mixin _$GameLastTimeDoneDaoMixin on DatabaseAccessor<AppDb> {
  $GameLastTimeDoneTable get gameLastTimeDone => db.gameLastTimeDone;
}
mixin _$GameDaoMixin on DatabaseAccessor<AppDb> {
  $GameTable get game => db.game;
}
