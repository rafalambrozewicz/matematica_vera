import 'package:matematica_vera/game/game_config.dart';
import 'package:matematica_vera/game/game_type.dart';

enum GameTag {
  addition_r10_e10,
  addition_r10_e100,
  subtraction_r10_e100,
  addition_r20_e250,
  subtraction_r20_e250,
}


class GameConfigBuilder {

  static forTag(GameTag tag) {
    switch (tag) {
      case GameTag.addition_r10_e10:
        return GameConfig(
          gameTag: GameTag.addition_r10_e10,
          type: GameType.addition,
          maxNumber: 10,
          answersCount: 4,
          exerciseCount: 10,
        );

      case GameTag.addition_r10_e100:
        return GameConfig(
          gameTag: GameTag.addition_r10_e100,
          type: GameType.addition,
          maxNumber: 10,
          answersCount: 3,
          exerciseCount: 100,
        );

      case GameTag.subtraction_r10_e100:
        return GameConfig(
          gameTag: GameTag.subtraction_r10_e100,
          type: GameType.subtraction,
          maxNumber: 10,
          answersCount: 3,
          exerciseCount: 100,
        );

      case GameTag.addition_r20_e250:
        return GameConfig(
          gameTag: GameTag.addition_r20_e250,
          type: GameType.addition,
          maxNumber: 20,
          answersCount: 3,
          exerciseCount: 250,
        );

      case GameTag.subtraction_r20_e250:
        return GameConfig(
          gameTag: GameTag.subtraction_r20_e250,
          type: GameType.subtraction,
          maxNumber: 20,
          answersCount: 3,
          exerciseCount: 250,
        );
    }
  }
}