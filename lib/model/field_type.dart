import 'package:enum_to_string/enum_to_string.dart';
import 'package:maisdata/model/field_keyboard_type.dart';
import 'package:maisdata/shared/exceptions/enum_parsing_exception.dart';

enum FieldType { NAME, QUANTITY, DATE, PHONE, NOTYPE }

extension FieldTypeStringExt on String {
  FieldType toFieldType() => EnumToString.fromString(FieldType.values, this);
}

extension FieldTypeExt on FieldType {
  String get description {
    switch (this) {
      case FieldType.NAME:
        return 'Nome';
      case FieldType.QUANTITY:
        return 'Quantidade';
      case FieldType.DATE:
        return 'Data';
      case FieldType.PHONE:
        return 'Telefone';
      case FieldType.NOTYPE:
        return 'Sem tipo específico';
      default:
        throw EnumParsingException('The field type $this has no description');
    }
  }

  FieldKeyboardType get keyboardType {
    switch (this) {
      case FieldType.NAME:
        return FieldKeyboardType.TEXT;
      case FieldType.QUANTITY:
        return FieldKeyboardType.NUMBER;
      case FieldType.DATE:
        return FieldKeyboardType.NUMBER;
      case FieldType.PHONE:
        return FieldKeyboardType.PHONE;
      case FieldType.NOTYPE:
        return FieldKeyboardType.TEXT;
      default:
        throw EnumParsingException('The field type $this has no keyboard type');
    }
  }
}
