import 'package:json_annotation/json_annotation.dart';

enum GameType {
  @JsonValue("addition") addition,
  @JsonValue("subtraction") subtraction
}