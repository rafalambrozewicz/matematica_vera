import 'package:flutter/foundation.dart';
import 'package:matematica_vera/domain/operation_type.dart';

class UniqueOperationsData {
  final int uniqueOperationsCount;
  final int uniqueAnswersCount;

  UniqueOperationsData(this.uniqueOperationsCount, this.uniqueAnswersCount);
}

class UniqueOperationsCountCalculator {

  UniqueOperationsData calculate({
      @required OperationType ot,
      @required int minNumber,
      @required int maxNumber,
      @required int maxResult
  }) {
    assert(ot != null);
    assert(minNumber != null);
    assert(maxNumber != null);
    assert(minNumber <= maxNumber);
    assert(maxResult != null);

    final uniqueOperations = Set<String>();
    final uniqueAnswers = Set<String>();
    for (int i=minNumber; i<=maxNumber; i++) {
      for (int j=minNumber; j<=maxNumber; j++) {

        if (ot == OperationType.addition) {
          final result = i + j;
          if (result >= 0 && result <= maxResult) {
            uniqueOperations.add("$i + $j");
            uniqueAnswers.add("$result");
          }
        }

        if (ot == OperationType.subtraction) {
          final result = i - j;
          if (result >= 0 && result <= maxResult) {
            uniqueOperations.add("$i - $j");
            uniqueAnswers.add("$result");
          }
        }

        if (ot == OperationType.multiplication) {
          final result = i * j;
          if (result >= 0 && result <= maxResult) {
            uniqueOperations.add("$i * $j");
            uniqueAnswers.add("$result");
          }
        }

        if (ot == OperationType.division && j != 0) {
          final result = i / j;
          final modulo = i % j;
          if (result >= 0 && result <= maxResult && modulo==0) {
            uniqueOperations.add("$i / $j");
            uniqueAnswers.add("${result.toInt()}");
          }
        }
      }
    }

    return UniqueOperationsData(
      uniqueOperations.length,
      uniqueAnswers.length,
    );

  }
}