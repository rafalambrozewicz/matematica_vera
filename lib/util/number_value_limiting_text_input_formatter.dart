import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NumberValueLimitingTextInputFormatter extends TextInputFormatter {

  final int maximumValueInclusive;

  NumberValueLimitingTextInputFormatter({@required this.maximumValueInclusive});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.isNotEmpty &&
        (_isNaN(newText) ||
        _hasTwoLeadingZeros(newText) ||
        _isGreaterThanMax(newText))) {
      return oldValue;
    }

    return newValue;
  }

  bool _isNaN(String input) {
    try {
      int.parse(input);
      return false;
    } catch (e) {
      return true;
    }
  }

  bool _hasTwoLeadingZeros(String input) => input.startsWith("00");

  bool _isGreaterThanMax(String input) {
    try {
      final v = int.parse(input);
      return v > maximumValueInclusive;
    } catch (e) {
      return true;
    }
  }
}