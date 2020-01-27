import 'package:flutter_test/flutter_test.dart';
import 'package:matematica_vera/domain/operation_type.dart';
import 'package:matematica_vera/domain/unique_operations_count_calculator.dart';

void main() {

  final uocc = UniqueOperationsCountCalculator();

  test("addition", () {
    final result = uocc.calculate(
        ot: OperationType.addition,
        minNumber: 1,
        maxNumber: 10,
        maxResult: 10);

    expect(result.uniqueOperationsCount, 45);
    expect(result.uniqueAnswersCount, 9);
  });

  test("subtraction", () {
    final result = uocc.calculate(
        ot: OperationType.subtraction,
        minNumber: 1,
        maxNumber: 10,
        maxResult: 10);

    expect(result.uniqueOperationsCount, 45);
    expect(result.uniqueAnswersCount, 9);
  });

  test("multiplication", () {
    final result = uocc.calculate(
        ot: OperationType.multiplication,
        minNumber: 1,
        maxNumber: 10,
        maxResult: 100);

    expect(result.uniqueOperationsCount, 100);
    expect(result.uniqueAnswersCount, 42);
  });

  test("division", () {
    final result = uocc.calculate(
        ot: OperationType.division,
        minNumber: 2,
        maxNumber: 20,
        maxResult: 10);

    expect(result.uniqueOperationsCount, 46);
    expect(result.uniqueAnswersCount, 10);
  });
}