import 'package:enum_to_string/enum_to_string.dart';

enum FieldKeyboardType { TEXT, NUMBER, PHONE, DATE }

extension StringExtensions on String {
  FieldKeyboardType toFieldKeyboardType() =>
      EnumToString.fromString(FieldKeyboardType.values, this);
}

extension EnumExtensions on FieldKeyboardType {
  String asString() => EnumToString.convertToString(this).toLowerCase();
}
