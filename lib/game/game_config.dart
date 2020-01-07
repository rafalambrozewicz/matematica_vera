import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:matematica_vera/game/game_type.dart';

part 'game_config.g.dart';

@JsonSerializable(nullable: false)
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

  factory GameConfig.fromJson(Map<String, dynamic> json) => _$GameConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GameConfigToJson(this);
}
