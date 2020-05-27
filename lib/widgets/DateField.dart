import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maisdata/shared/field_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateField extends StatelessWidget {
  final String label;
  final String helperText;
  final void Function(String text) onChanged;
  final bool isRequired;

  DateField({this.label, this.helperText, this.onChanged, this.isRequired});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        MaskTextInputFormatter(
            mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')})
      ],
      keyboardType: TextInputType.datetime,
      onChanged: (text) => onChanged(text),
      validator: isRequired ? emptynessValidator : null,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          helperText: helperText),
    );
  }
}
