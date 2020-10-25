import 'package:flutter_test/flutter_test.dart';
import 'package:maisdata/model/field_mask.dart';

void main() {
  test('should return DATE', () {
    //assert
    expect('date'.toFieldMask(), FieldMask.DATE);
    expect('DATE'.toFieldMask(), FieldMask.DATE);
  });
  test('should return DECIMAL', () {
    //assert
    expect('decimal'.toFieldMask(), FieldMask.DECIMAL);
    expect('DECIMAL'.toFieldMask(), FieldMask.DECIMAL);
  });
  test('should return NONE', () {
    //assert
    expect('none'.toFieldMask(), FieldMask.NONE);
    expect('NONE'.toFieldMask(), FieldMask.NONE);
  });
  test('WHEN input is unexpected, should return none', () {
    //assert
    expect('adf'.toFieldMask(), FieldMask.NONE);
  });
}
