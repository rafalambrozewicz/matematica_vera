// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    json['config'],
    json['currentExerciseNumber'] as int,
    (json['exercises'] as List)
        .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'config': instance.config,
      'currentExerciseNumber': instance.currentExerciseNumber,
      'exercises': instance.exercises,
    };
