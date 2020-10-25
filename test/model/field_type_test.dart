import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_type.dart';

void main() {
  group('converting string to a fieldtype', () {
    test('should return Name', () {
      //arrange
      expect(FieldType.stringToFieldType('name'), isA<Name>());
      expect(FieldType.stringToFieldType('NAME'), isA<Name>());
    });
    test('should return Quantity', () {
      //arrange
      expect(FieldType.stringToFieldType('quantity'), isA<Quantity>());
      expect(FieldType.stringToFieldType('QUANTITY'), isA<Quantity>());
    });
    test('should return Date', () {
      //arrange
      expect(FieldType.stringToFieldType('date'), isA<Date>());
      expect(FieldType.stringToFieldType('DATE'), isA<Date>());
    });
    test('should return Name', () {
      //arrange
      expect(FieldType.stringToFieldType('notype'), isA<NoType>());
      expect(FieldType.stringToFieldType('NOTYPE'), isA<NoType>());
    });
    test('WHEN input is an invalid string, should return NoType', () {
      //arrange
      expect(FieldType.stringToFieldType('fadsf'), isA<NoType>());
      expect(FieldType.stringToFieldType('FASDF'), isA<NoType>());
    });
  });
}
