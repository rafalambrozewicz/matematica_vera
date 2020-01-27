import 'package:json_annotation/json_annotation.dart';

enum OperationType {
  @JsonValue("addition") addition,
  @JsonValue("subtraction") subtraction,
  @JsonValue("multiplication") multiplication,
  @JsonValue("division") division
}