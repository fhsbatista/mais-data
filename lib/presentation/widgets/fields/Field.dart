import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maisdata/shared/field_validators.dart';
import 'package:maisdata/shared/formatters.dart';
import 'package:maisdata/shared/masks.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Field extends StatelessWidget {
  final InputDecoration decoration;
  final bool isRequired;
  final double padding;
  final TextInputFormatter formatter;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final FieldType fieldType;
  final void Function(String text) onChanged;

  Field._builder(FieldBuilder builder)
      : decoration = builder.decoration,
        isRequired = builder.isRequired,
        padding = builder.padding,
        formatter = builder.formatter,
        keyboardType = builder.keyboardType,
        capitalization = builder.capitalization,
        fieldType = builder.fieldType,
        onChanged = builder.onChanged;

  String getLabel() {
    return this.decoration.labelText;
  }

  String getHelper() {
    return this.decoration.helperText;
  }

  String getTypeDescription() {
    return this.fieldType.getDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        inputFormatters: [formatter],
        keyboardType: keyboardType,
        decoration: decoration,
        validator: isRequired ? emptynessValidator : null,
        textCapitalization: capitalization,
      ),
    );
  }
}

class FieldBuilder {
  InputDecoration decoration = InputDecoration(border: OutlineInputBorder());
  TextInputFormatter formatter = UselessFormatter();
  TextInputType keyboardType = TextInputType.text;
  TextCapitalization capitalization = TextCapitalization.none;
  FieldType fieldType = FieldType.NO_TYPE;
  bool isRequired = false;
  double padding = 10;
  void Function(String text) onChanged;

  FieldBuilder();

  setLabel(String label) {
    this.decoration = decoration.copyWith(labelText: label);
  }

  setHelper(String helper) {
    this.decoration = decoration.copyWith(helperText: helper);
  }

  setBorder(InputBorder border) {
    this.decoration = decoration.copyWith(border: border);
  }

  setNameFormatter() {
    this.capitalization = TextCapitalization.words;
  }

  setDecimalFormatter() {
    this.formatter = DecimalNumberFormatter();
    this.keyboardType = TextInputType.number;
  }

  setDateFormatter() {
    this.formatter = MaskTextInputFormatter(
        mask: kDateMask, filter: {"#": RegExp(r'[0-9]')});
    this.keyboardType = TextInputType.datetime;
  }

  setOnlyNumbersKeyboard() {
    this.keyboardType = TextInputType.number;
  }

  setType(FieldType type) {
    fieldType = type;
    switch (type) {
      case FieldType.NAME:
        {
          _setNameType();
        }
        break;
      case FieldType.DATE:
        {
          _setNameType();
        }
        break;
      case FieldType.QUANTITY:
        {
          _setNameType();
        }
        break;
      default:
        {
          _setNameType();
        }
        break;
    }
  }

  _setNameType() {
    capitalization = TextCapitalization.words;
    keyboardType = TextInputType.text;
  }

  Field build() {
    return Field._builder(this);
  }
}

enum FieldType { NAME, QUANTITY, DATE, NO_TYPE }

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
