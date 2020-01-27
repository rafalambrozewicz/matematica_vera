import 'dart:convert';
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:matematica_vera/db/core/db_config.dart' as db;
import 'package:matematica_vera/domain/exercise.dart';
import 'package:matematica_vera/domain/game_config.dart';
import 'package:matematica_vera/domain/operation_type.dart';
import 'package:matematica_vera/util/extensions.dart';
import 'package:moor/moor.dart';

import 'package:tuple/tuple.dart';

part 'game.g.dart';

@JsonSerializable(nullable: false)
class Game {
  final String id;
  final int currentExerciseNumber;
  final int errorCount;
  final List<Exercise> exercises;

  Game(this.id, this.currentExerciseNumber, this.exercises,  this.errorCount);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  Game.toNextExercise(Game g):
        id = g.id,
        currentExerciseNumber = g.currentExerciseNumber+1,
        errorCount = g.errorCount,
        exercises = g.exercises;

  Game.addError(Game g):
        id = g.id,
        currentExerciseNumber = g.currentExerciseNumber,
        errorCount = g.errorCount + 1,
        exercises = g.exercises;

  Game.fromConfig(GameConfig config):
        id = config.id,
        currentExerciseNumber = 0,
        errorCount = 0,
        exercises = _generateExercises(config);

  Game.fromGameData(db.GameData entry):
        id = entry.id,
        currentExerciseNumber = Game.fromJson(json.decode(entry.gameJson)).currentExerciseNumber,
        errorCount = Game.fromJson(json.decode(entry.gameJson)).errorCount,
        exercises = Game.fromJson(json.decode(entry.gameJson)).exercises;

  db.GameCompanion toGameCompanion() => db.GameCompanion(
    id: Value(this.id),
    gameJson: Value(json.encode(this.toJson()))
  );
}

List<Exercise> _generateExercises(GameConfig config) {
  final tuples = _correctSizeOfTuples(
      _generateUniqueTuples(config),
      config.numberOfExercises);

  switch (config.operationType) {
    case OperationType.addition:
      return tuples.map((t) =>
          t.toAddition(config.numberOfAnswers, config.maxResult)).toList();

    case OperationType.subtraction:
      return tuples.map((t) =>
          t.toSubtraction(config.numberOfAnswers, config.maxResult)).toList();

    case OperationType.multiplication:
      return tuples.map((t) =>
          t.toMultiplication(config.numberOfAnswers, config.maxResult)).toList();

    case OperationType.division:
      return tuples.map((t) =>
          t.toDivision(config.numberOfAnswers, config.maxResult)).toList();
  }

  throw Exception("Unsuported `OperationType`");
}

List<Tuple2<int, int>> _generateUniqueTuples(GameConfig config) {
  final tuples = Set<Tuple2<int, int>>();
  for (int i=config.minNumber; i<=config.maxNumber; i++) {
    for (int j=config.minNumber; j<=config.maxNumber; j++) {

      if (config.operationType == OperationType.addition) {
        final result = i + j;
        if (result >= 0 && result <= config.maxResult) {
          tuples.add(Tuple2(i, j));
        }
      }

      if (config.operationType == OperationType.subtraction) {
        final result = i - j;
        if (result >= 0 && result <= config.maxResult) {
          tuples.add(Tuple2(i, j));
        }
      }

      if (config.operationType == OperationType.multiplication) {
        final result = i * j;
        if (result >= 0 && result <= config.maxResult) {
          tuples.add(Tuple2(i, j));
        }
      }

      if (config.operationType == OperationType.division && j != 0) {
        final result = i / j;
        final modulo = i % j;
        if (result >= 0 && result <= config.maxResult && modulo==0) {
          tuples.add(Tuple2(i, j));
        }
      }
    }
  }

  return tuples.toList();
}

List<Tuple2<int, int>> _correctSizeOfTuples(List<Tuple2<int, int>> inputTuples, int numberOfExercises) {
  final random = Random(DateTime.now().millisecondsSinceEpoch);

  final tuples = List.of(inputTuples);

  tuples.shuffle(random);

  if (tuples.length > numberOfExercises) {
    return tuples.sublist(0, numberOfExercises).toList();
  } else if (tuples.length < numberOfExercises) {
    final duplicatesCount = numberOfExercises - tuples.length;
    for (int i=0; i<duplicatesCount; i++) {
      final randomTuple = tuples[Random(DateTime.now().millisecondsSinceEpoch).nextInt(tuples.length)];
      tuples.add(Tuple2(randomTuple.item1, randomTuple.item2));
    }
  }

  return tuples;
}