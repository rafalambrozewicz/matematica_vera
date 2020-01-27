// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    riddleObscured: json['riddleObscured'] as String,
    riddleAnswered: json['riddleAnswered'] as String,
    correctAnswer: json['correctAnswer'] as String,
    possibleAnswers:
        (json['possibleAnswers'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'riddleObscured': instance.riddleObscured,
      'riddleAnswered': instance.riddleAnswered,
      'correctAnswer': instance.correctAnswer,
      'possibleAnswers': instance.possibleAnswers,
    };
