import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'exercise.g.dart';

@JsonSerializable(nullable: false)
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

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}