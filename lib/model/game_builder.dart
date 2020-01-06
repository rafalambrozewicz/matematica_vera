import 'package:flutter/material.dart';

import 'game_type.dart';

enum GameTag {
  addition_r10,
  subtraction_r10,
  addition_r20,
  subtraction_r20,
}

class GameConfig {
  final GameType type;
  final int maxNumber;
  final int answersCount;
  final int exerciseCount;

  GameConfig({
    @required this.type,
    @required this.maxNumber,
    @required this.answersCount,
    @required this.exerciseCount
  });
}

class GameConfigBuilder {

  static forTag(GameTag tag) {
    switch (tag) {
      case GameTag.addition_r10:
        return GameConfig(
          type: GameType.addition,
          maxNumber: 10,
          answersCount: 3,
          exerciseCount: 100,
        );

      case GameTag.subtraction_r10:
        return GameConfig(
          type: GameType.subtraction,
          maxNumber: 10,
          answersCount: 3,
          exerciseCount: 100,
        );

      case GameTag.addition_r20:
        return GameConfig(
          type: GameType.addition,
          maxNumber: 20,
          answersCount: 3,
          exerciseCount: 250,
        );

      case GameTag.subtraction_r20:
        return GameConfig(
          type: GameType.subtraction,
          maxNumber: 20,
          answersCount: 3,
          exerciseCount: 250,
        );
    }
  }

}