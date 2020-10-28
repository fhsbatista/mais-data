import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_keyboard_type.dart';

void main() {
  group('parsing from string', () {
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
  });
  group('parsing to string', () {
    test('should return TEXT', () {
      //assert
      expect(FieldKeyboardType.TEXT.asString(), 'text');
    });
    test('should return NUMBER', () {
      //assert
      expect(FieldKeyboardType.NUMBER.asString(), 'number');
    });
    test('should return PHONE', () {
      //assert
      expect(FieldKeyboardType.PHONE.asString(), 'phone');
    });
  });
}
