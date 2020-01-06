import 'package:flutter/material.dart';

class Exercise {
  final String riddleObscured;
  final String riddleAnswered;
  final String correctAnswer;
  final List<String> possibleAnswers;

  Exercise({
    @required this.riddleObscured,
    @required this.riddleAnswered,
    @required this.correctAnswer,
    @required this.possibleAnswers
  });
}