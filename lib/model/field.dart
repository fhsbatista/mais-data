import 'package:maisdata/presentation/widgets/fields/field_widget.dart';

class Field {
  final String label;
  final String helper;
  final bool isRequired;
  final FieldCapitalization capitalization;
  final FieldType type;
  final FieldKeyboardType keyboardType;
  final FieldMask mask;

  Field({
    this.label,
    this.helper,
    this.isRequired,
    this.capitalization = FieldCapitalization.NONE,
    this.type = FieldType.NO_TYPE,
    this.keyboardType = FieldKeyboardType.TEXT,
    this.mask = FieldMask.NONE,
  });
}

enum FieldCapitalization { WORDS, SENTENCES, CHARS, NONE }
enum FieldType { NAME, QUANTITY, DATE, NO_TYPE }
enum FieldKeyboardType { TEXT, NUMBER, PHONE }
enum FieldMask { DECIMAL, DATE, NONE }

extension FieldTypeExtensions on FieldType {
  String getDescription() {
    switch (this) {
      case FieldType.NAME:
        {
          return 'Nome';
        }
        break;
      case FieldType.QUANTITY:
        {
          return 'Quantidade';
        }
        break;
      case FieldType.DATE:
        {
          return 'Data';
        }
        break;
      default:
        {
          return 'Sem tipo';
        }
        break;
    }
  }
}

extension FieldExtensions on Field {
  FieldWidget toFieldWidget() {
    return (FieldWidgetBuilder()
          ..isRequired = this.isRequired
          ..setLabel(this.label)
          ..setType(this.type))
        .build();
  }
}
