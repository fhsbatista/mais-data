import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_capitalization.dart';

void main() {
  test('should return WORDS', () {
    //assert
    expect('words'.toFieldCapitalization(), FieldCapitalization.WORDS);
    expect('WORDS'.toFieldCapitalization(), FieldCapitalization.WORDS);
  });
  test('should return SENTENCES', () {
    //assert
    expect('sentences'.toFieldCapitalization(), FieldCapitalization.SENTENCES);
    expect('SENTENCES'.toFieldCapitalization(), FieldCapitalization.SENTENCES);
  });
  test('should return CHARS', () {
    //assert
    expect('chars'.toFieldCapitalization(), FieldCapitalization.CHARS);
    expect('CHARS'.toFieldCapitalization(), FieldCapitalization.CHARS);
  });
  test('should return NONE', () {
    //assert
    expect('none'.toFieldCapitalization(), FieldCapitalization.NONE);
    expect('NONE'.toFieldCapitalization(), FieldCapitalization.NONE);
  });
  test('WHEN input is unexpected, should return NONE', () {
    //assert
    expect('invalid'.toFieldCapitalization(), FieldCapitalization.NONE);
  });
}
