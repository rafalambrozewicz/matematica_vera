import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematica_vera/model/answers_generator.dart';
import 'package:matematica_vera/model/exercise.dart';
import 'package:matematica_vera/model/game_builder.dart';
import 'package:matematica_vera/model/game_type.dart';
import 'package:matematica_vera/model/tuples_generator.dart';
import 'package:tuple/tuple.dart';

class Game {
  final GameConfig config;
  final int currentExerciseNumber;
  final List<Exercise> exercises;


  Game(this.config, this.currentExerciseNumber, this.exercises);

  copy({
    @required int currentExerciseNumber
  }) => Game(this.config, currentExerciseNumber, this.exercises);

  Game.fromConfig(GameConfig config):
        config = config,
        currentExerciseNumber = 0,
        exercises = _generateExercises(config);

  static List<Exercise> _generateExercises(GameConfig config) {
    switch (config.type) {
      case GameType.addition:
        return TuplesGenerator.generateForAddition(
            maxNumber: config.maxNumber,
            desiredCount: config.exerciseCount)
            .map((t) =>
            Exercise(
                riddleObscured: "${t.item1} + ${t.item2} = ?",
                riddleAnswered: "${t.item1} + ${t.item2} = ${AnswersGenerator
                    .getCorrectForAddition(tuple: t)}",
                correctAnswer: AnswersGenerator.getCorrectForAddition(tuple: t)
                    .toString(),
                possibleAnswers: AnswersGenerator.generate(
                    correctAnswer: AnswersGenerator.getCorrectForAddition(
                        tuple: t),
                    maxNumber: config.maxNumber,
                    answersCount: config.answersCount).map((number) =>
                    number.toString()).toList(growable: false)))
            .toList(growable: false);

      case GameType.subtraction:
        return TuplesGenerator.generateForSubtraction(
            maxNumber: config.maxNumber,
            desiredCount: config.exerciseCount)
            .map((t) =>
            Exercise(
                riddleObscured: "${t.item1} - ${t.item2} = ?",
                riddleAnswered: "${t.item1} - ${t.item2} = ${AnswersGenerator
                    .getCorrectForSubtraction(tuple: t)}",
                correctAnswer: AnswersGenerator.getCorrectForSubtraction(tuple: t)
                    .toString(),
                possibleAnswers: AnswersGenerator.generate(
                    correctAnswer: AnswersGenerator.getCorrectForSubtraction(
                        tuple: t),
                    maxNumber: config.maxNumber,
                    answersCount: config.answersCount).map((number) =>
                    number.toString()).toList(growable: false)))
            .toList(growable: false);
    }
  }

}