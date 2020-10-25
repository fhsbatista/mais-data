import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_keyboard_type.dart';

void main() {
  test('should return TEXT', () {
    //assert
    expect('text'.toFieldKeyboardType(), FieldKeyboardType.TEXT);
    expect('TEXT'.toFieldKeyboardType(), FieldKeyboardType.TEXT);
  });
  test('should return NUMBER', () {
    //assert
    expect('number'.toFieldKeyboardType(), FieldKeyboardType.NUMBER);
    expect('NUMBER'.toFieldKeyboardType(), FieldKeyboardType.NUMBER);
  });
  test('should return PHONE', () {
    //assert
    expect('phone'.toFieldKeyboardType(), FieldKeyboardType.PHONE);
    expect('PHONE'.toFieldKeyboardType(), FieldKeyboardType.PHONE);
  });
  test('WHEN input is unexpected, should return null', () {
    //assert
    expect('asdf'.toFieldKeyboardType(), null);
  });
}
