import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';



class AnswersGenerator {
  static const _correct_answer_size = 1;

  static int getCorrectForAddition({
    @required Tuple2<int, int> tuple
  }) => tuple.item1 + tuple.item2;

  static int getCorrectForSubtraction({
    @required Tuple2<int, int> tuple
  }) => tuple.item1 - tuple.item2;

  static List<int> generate({
    @required int correctAnswer,
    @required int maxNumber,
    @required int answersCount,
  }) {
    final random = Random(DateTime.now().millisecondsSinceEpoch);
    final count = answersCount - _correct_answer_size;

    final minStart = (correctAnswer-count > 0) ? correctAnswer-count : 0;
    final maxStart = (correctAnswer+count > maxNumber) ? maxNumber-count : correctAnswer;

    final start = minStart==maxStart ? minStart : random.nextInt(maxStart-minStart) + minStart;

    final List<int> answers = [];
    for(int i=start; i<=start+count; i++) {
      answers.add(i);
    }

    return answers;
  }
}
