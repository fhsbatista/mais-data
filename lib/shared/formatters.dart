import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LowerCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
          TextEditingValue oldValue, TextEditingValue newValue) =>
      newValue.copyWith(text: newValue.text.toLowerCase());
}

class UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
          TextEditingValue oldValue, TextEditingValue newValue) =>
      newValue.copyWith(text: newValue.text.toUpperCase());
}

class DecimalNumberFormatter extends TextInputFormatter {
  final int hundreds;

  DecimalNumberFormatter({this.hundreds = 1});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final divisor = pow(10, hundreds);
    final numberTypedAsDouble = double.parse(newValue.text.replaceAll('.', ''));
    final value = numberTypedAsDouble / divisor;
    final newText = value.toString();

    var selection =
        TextSelection.fromPosition(TextPosition(offset: newText.length));
    return newValue.copyWith(text: newText, selection: selection);
  }
}
