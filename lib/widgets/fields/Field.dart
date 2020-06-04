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

  void Function(String text) onChanged;

  Field._builder(FieldBuilder builder)
      : decoration = builder.decoration,
        isRequired = builder.isRequired,
        padding = builder.padding,
        formatter = builder.formatter,
        keyboardType = builder.keyboardType,
        onChanged = builder.onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        inputFormatters: [formatter],
        keyboardType: keyboardType,
        decoration: decoration,
        validator: isRequired ? emptynessValidator : null,
      ),
    );
  }
}

class FieldBuilder {
  InputDecoration decoration = InputDecoration(border: OutlineInputBorder());
  TextInputFormatter formatter = UselessFormatter();
  TextInputType keyboardType = TextInputType.text;
  bool isRequired = false;
  double padding = 10;
  void Function(String text) onChanged;

  FieldBuilder();

  void setLabel(String label) {
    this.decoration = decoration.copyWith(labelText: label);
  }

  void setBorder(InputBorder border) {
    this.decoration = decoration.copyWith(border: border);
  }

  void setDecimalFormatter() {
    this.formatter = DecimalNumberFormatter();
    this.keyboardType = TextInputType.number;
  }

  void setDateFormatter() {
    this.formatter = MaskTextInputFormatter(
        mask: kDateMask, filter: {"#": RegExp(r'[0-9]')});
    this.keyboardType = TextInputType.datetime;
  }

  Field build() {
    return Field._builder(this);
  }
}
