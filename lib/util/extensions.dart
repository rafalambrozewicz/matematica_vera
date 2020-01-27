import 'dart:math';

import 'package:matematica_vera/domain/exercise.dart';
import 'package:tuple/tuple.dart';

extension Excersies on Tuple2<int, int> {

  Exercise toAddition(int numberOfAnswers, int maxResult) =>
      Exercise(
        riddleObscured: "${this.item1} + ${this.item2} = ?",
        riddleAnswered: "${this.item1} + ${this.item2} = ${this.item1 +
            this.item2}",
        correctAnswer: "${this.item1 + this.item2}",
        possibleAnswers: _generateAnswers(this.item1 + this.item2, maxResult, numberOfAnswers),
      );

  Exercise toSubtraction(int numberOfAnswers, int maxResult) =>
      Exercise(
        riddleObscured: "${this.item1} - ${this.item2} = ?",
        riddleAnswered: "${this.item1} - ${this.item2} = ${this.item1 -
            this.item2}",
        correctAnswer: "${this.item1 - this.item2}",
        possibleAnswers: _generateAnswers(this.item1 - this.item2, maxResult, numberOfAnswers),
      );

  Exercise toMultiplication(int numberOfAnswers, int maxResult) =>
      Exercise(
        riddleObscured: "${this.item1} × ${this.item2} = ?",
        riddleAnswered: "${this.item1} × ${this.item2} = ${this.item1 *
            this.item2}",
        correctAnswer: "${this.item1 * this.item2}",
        possibleAnswers: _generateAnswers(this.item1 * this.item2, maxResult, numberOfAnswers),
      );

  Exercise toDivision(int numberOfAnswers, int maxResult) =>
      Exercise(
        riddleObscured: "${this.item1} ÷ ${this.item2} = ?",
        riddleAnswered: "${this.item1} ÷ ${this.item2} = ${this.item1 ~/
            this.item2}",
        correctAnswer: "${(this.item1 ~/ this.item2)}",
        possibleAnswers: _generateAnswers((this.item1 ~/ this.item2), maxResult, numberOfAnswers),
      );
}

const _correct_answer_size = 1;

List<String> _generateAnswers(int correctAnswer, int maxNumber, int answersCount) {
  final random = Random(DateTime.now().millisecondsSinceEpoch);
  final count = answersCount - _correct_answer_size;

  final minStart = (correctAnswer - count > 0) ? correctAnswer - count : 0;
  final maxStart = (correctAnswer + count > maxNumber)
      ? maxNumber - count
      : correctAnswer;

  final start = minStart == maxStart ? minStart : random.nextInt(
      maxStart - minStart) + minStart;

  final List<int> answers = [];
  for (int i = start; i <= start + count; i++) {
    answers.add(i);
  }

  return answers.map((a) => a.toString()).toList();
}