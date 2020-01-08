abstract class GameBlocState {
  final int currentExerciseNumber;
  final int exerciseCount;
  final String exerciseText;
  final List<String> possibleAnswers;

  GameBlocState(
      this.currentExerciseNumber,
      this.exerciseCount,
      this.exerciseText,
      this.possibleAnswers);
}

class Loading extends GameBlocState {
  Loading.initial() : super(0, 0, "", <String>[]);

  Loading.from(
      GameBlocState state,
      { int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class DisplayExercise extends GameBlocState {
  DisplayExercise.from(
      GameBlocState state,
      { int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class DisplayCorrectAnswer extends GameBlocState {
  final String correctAnswer;

  DisplayCorrectAnswer.from(
      GameBlocState state,
      { this.correctAnswer,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class DisplayWrongAnswer extends GameBlocState {
  final String wrongAnswer;

  DisplayWrongAnswer.from(
      GameBlocState state,
      { this.wrongAnswer,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class ExerciseFinished extends GameBlocState {
  ExerciseFinished.from(
      GameBlocState state,
      { int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}
