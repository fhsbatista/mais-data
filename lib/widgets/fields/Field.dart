import 'package:flutter/material.dart';
import 'package:maisdata/shared/field_validators.dart';

class Field extends StatelessWidget {
  InputDecoration decoration;
  String helperText;
  bool isRequired = false;
  String mask;
  void Function(String text) onChanged;

  Field(this.helperText);

  Field._builder(FieldBuilder builder)
      : decoration = builder.decoration,
        helperText = builder.helperText,
        isRequired = builder.isRequired,
        mask = builder.mask,
        onChanged = builder.onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      validator: isRequired ? emptynessValidator : null,
    );
  }
}

class FieldBuilder {
  InputDecoration decoration = InputDecoration();
  String helperText;
  String mask;
  void Function(String text) onChanged;

  FieldBuilder();

  bool isRequired = false;

  FieldBuilder setLabel(String label) {
    this.decoration = decoration.copyWith(labelText: label);
  }

  FieldBuilder setBorder(InputBorder border) {
    this.decoration = decoration.copyWith(border: border);
  }

  Field build() {
    return Field._builder(this);
  }
}
