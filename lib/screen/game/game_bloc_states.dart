abstract class GameBlocState {
  final bool showErrors;
  final int numberOfErrors;
  final int currentExerciseNumber;
  final int exerciseCount;
  final String exerciseText;
  final List<String> possibleAnswers;

  GameBlocState(
      this.showErrors,
      this.numberOfErrors,
      this.currentExerciseNumber,
      this.exerciseCount,
      this.exerciseText,
      this.possibleAnswers);
}

class Loading extends GameBlocState {
  Loading.initial({bool showErrors}) : super(showErrors, 0, 0, 0, "", <String>[]);

  Loading.from(
      GameBlocState state,
      { bool showErrors,
        int numberOfErrors,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      showErrors ?? state.showErrors,
      numberOfErrors ?? state.numberOfErrors,
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class DisplayExercise extends GameBlocState {
  DisplayExercise.from(
      GameBlocState state,
      { bool showErrors,
        int numberOfErrors,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      showErrors ?? state.showErrors,
      numberOfErrors ?? state.numberOfErrors,
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
        bool showErrors,
        int numberOfErrors,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      showErrors ?? state.showErrors,
      numberOfErrors ?? state.numberOfErrors,
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
        bool showErrors,
        int numberOfErrors,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      showErrors ?? state.showErrors,
      numberOfErrors ?? state.numberOfErrors,
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}

class ExerciseFinished extends GameBlocState {
  ExerciseFinished.from(
      GameBlocState state,
      { bool showErrors,
        int numberOfErrors,
        int currentExerciseNumber,
        int exerciseCount,
        String exerciseText,
        List<String> possibleAnswers})
      : super(
      showErrors ?? state.showErrors,
      numberOfErrors ?? state.numberOfErrors,
      currentExerciseNumber ?? state.currentExerciseNumber,
      exerciseCount ?? state.exerciseCount,
      exerciseText ?? state.exerciseText,
      possibleAnswers ?? state.possibleAnswers);
}
