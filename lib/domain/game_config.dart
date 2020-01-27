import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/db/core/db_config.dart';
import 'package:matematica_vera/domain/operation_type.dart';
import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

class GameConfig {
  final String id;
  final String customName;
  final Color color;
  final OperationType operationType;
  final int minNumber;
  final int maxNumber;
  final int maxResult;
  final int numberOfExercises;
  final int numberOfAnswers;
  final bool showErrorsCount;

  GameConfig({
    this.id,
    this.customName,
    this.color,
    this.operationType,
    this.minNumber,
    this.maxNumber,
    this.maxResult,
    this.numberOfExercises,
    this.numberOfAnswers,
    this.showErrorsCount
  });

  GameConfigCompanion toGameConfigCompanion() =>
      GameConfigCompanion(
        id: Value(id),
        customName: (customName!=null) ?  Value(customName) : const Value.absent(),
        color: Value(color.value),
        operationType: Value(operationType.toString()),
        minNumber: Value(minNumber),
        maxNumber: Value(maxNumber),
        maxResult: Value(maxResult),
        numberOfExercises: Value(numberOfExercises),
        numberOfAnswers: Value(numberOfAnswers),
        showErrorsCount: Value(showErrorsCount),
      );

  GameConfig.fromGameConfigData(GameConfigData gcd):
        id = gcd.id,
        customName = gcd.customName,
        color = Color(gcd.color),
        operationType = OperationType.values.firstWhere((ot) => ot.toString() == gcd.operationType),
        minNumber = gcd.minNumber,
        maxNumber = gcd.maxNumber,
        maxResult = gcd.maxResult,
        numberOfExercises = gcd.numberOfExercises,
        numberOfAnswers = gcd.numberOfAnswers,
        showErrorsCount = gcd.showErrorsCount;

  String title(AppLocalization loc) =>
      customName ?? loc.operation(operationType);

  String longTitle(AppLocalization loc) =>
      customName ?? "${loc.operation(operationType)} <$minNumber;$maxNumber>";
}

final defaultGameConfigs = <GameConfig>[
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.yellow[300],
      operationType: OperationType.addition,
      minNumber: 0,
      maxNumber: 5,
      maxResult: 5,
      numberOfExercises: 10,
      numberOfAnswers: 2,
      showErrorsCount: false
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.amber[300],
      operationType: OperationType.addition,
      minNumber: 1,
      maxNumber: 10,
      maxResult: 10,
      numberOfExercises: 25,
      numberOfAnswers: 3,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.orange[300],
      operationType: OperationType.addition,
      minNumber: 1,
      maxNumber: 10,
      maxResult: 10,
      numberOfExercises: 50,
      numberOfAnswers: 4,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.deepOrange[300],
      operationType: OperationType.addition,
      minNumber: 1,
      maxNumber: 15,
      maxResult: 15,
      numberOfExercises: 100,
      numberOfAnswers: 6,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.red[300],
      operationType: OperationType.addition,
      minNumber: 1,
      maxNumber: 20,
      maxResult: 20,
      numberOfExercises: 200,
      numberOfAnswers: 4,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.pink[300],
      operationType: OperationType.multiplication,
      minNumber: 1,
      maxNumber: 10,
      maxResult: 100,
      numberOfExercises: 100,
      numberOfAnswers: 6,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.teal[300],
      operationType: OperationType.subtraction,
      minNumber: 1,
      maxNumber: 10,
      maxResult: 10,
      numberOfExercises: 50,
      numberOfAnswers: 4,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.cyan[300],
      operationType: OperationType.subtraction,
      minNumber: 1,
      maxNumber: 15,
      maxResult: 15,
      numberOfExercises: 100,
      numberOfAnswers: 6,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.lightBlue[300],
      operationType: OperationType.subtraction,
      minNumber: 1,
      maxNumber: 20,
      maxResult: 20,
      numberOfExercises: 200,
      numberOfAnswers: 4,
      showErrorsCount: true
  ),
  GameConfig(
      id: Uuid().v4().replaceAll("-", ""),
      color: Colors.deepPurple[300],
      operationType: OperationType.division,
      minNumber: 2,
      maxNumber: 20,
      maxResult: 20,
      numberOfExercises: 25,
      numberOfAnswers: 4,
      showErrorsCount: true
  ),
];