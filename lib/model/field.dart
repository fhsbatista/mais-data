import 'dart:convert';

import 'package:maisdata/model/field_capitalization.dart';
import 'package:maisdata/model/field_keyboard_type.dart';
import 'package:maisdata/model/field_mask.dart';
import 'package:maisdata/model/field_type.dart';
import 'package:maisdata/presentation/widgets/fields/field_widget.dart';

class Field extends JsonEncoder {
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
    this.type,
    this.keyboardType = FieldKeyboardType.TEXT,
    this.mask = FieldMask.NONE,
  });

  Map<String, dynamic> toJson() => {
        'label': label.toString(),
        'helper': helper.toString(),
        'isRequired': isRequired.toString(),
        'capitalization': capitalization.toString(),
        'type': type.toString(),
        'keyboardType': keyboardType.toString(),
        'mask': mask.toString(),
      };

  static String toJsonList(List<Field> fields) {
    return jsonEncode(fields.map((e) => jsonEncode(e)).toList());
  }

  static Field fromJson(String source) {
    final json = jsonDecode(source);
    return Field(
      label: json['label'],
      helper: json['helper'],
      isRequired: json['isRequired'] == 'true' ? true : false,
      capitalization: '${json['capitalization']}'.toFieldCapitalization(),
      type: FieldType.stringToFieldType(json['type']),
      keyboardType: '${json['keyboardType']}'.toFieldKeyboardType(),
      mask: '${json['mask']}'.toFieldMask(),
    );
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
