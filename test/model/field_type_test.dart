import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_keyboard_type.dart';
import 'package:maisdata/model/field_type.dart';
import 'package:maisdata/shared/exceptions/enum_parsing_exception.dart';

void main() {
  group('converting string to a fieldtype', () {
    test('should return Name', () {
      //arrange
      expect('name'.toFieldType(), FieldType.NAME);
      expect('NAME'.toFieldType(), FieldType.NAME);
    });
    test('should return Quantity', () {
      //arrange
      expect('quantity'.toFieldType(), FieldType.QUANTITY);
      expect('QUANTITY'.toFieldType(), FieldType.QUANTITY);
    });
    test('should return Date', () {
      //arrange
      expect('date'.toFieldType(), FieldType.DATE);
      expect('DATE'.toFieldType(), FieldType.DATE);
    });
    test('should return Phone', () {
      //arrange
      expect('phone'.toFieldType(), FieldType.PHONE);
      expect('PHONE'.toFieldType(), FieldType.PHONE);
    });
    test('should return NOTYPE', () {
      //arrange
      expect('notype'.toFieldType(), FieldType.NOTYPE);
      expect('NOTYPE'.toFieldType(), FieldType.NOTYPE);
    });
  });

  group('WHEN getting the keyboard type', () {
    test('should return TEXT', () {
      //assert
      expect(FieldType.NAME.keyboardType, FieldKeyboardType.TEXT);
      expect(FieldType.NOTYPE.keyboardType, FieldKeyboardType.TEXT);
    });
    test('should return NUMBER', () {
      //assert
      expect(FieldType.QUANTITY.keyboardType, FieldKeyboardType.NUMBER);
      expect(FieldType.DATE.keyboardType, FieldKeyboardType.NUMBER);
    });
    test('should return PHONE', () {
      //assert
      expect(FieldType.PHONE.keyboardType, FieldKeyboardType.PHONE);
    });
  });
}
