import 'package:matematica_vera/domain/game_config.dart';

abstract class GameBlocEvent { }

class Initialize extends GameBlocEvent { }

class Restart extends GameBlocEvent {
  final GameConfig gameConfig;

  Restart(this.gameConfig);
}

class AnswerSelected extends GameBlocEvent {
  final String answer;

  AnswerSelected(this.answer);
}