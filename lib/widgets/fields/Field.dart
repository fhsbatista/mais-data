import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maisdata/shared/field_validators.dart';
import 'package:maisdata/shared/masks.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Field extends StatelessWidget {
  final String label;
  final String helperText;
  final bool isRequired;
  final String mask;
  final void Function(String text) onChanged;

  Field(
      {this.label,
      this.helperText,
      this.isRequired,
      this.mask,
      this.onChanged});

  static Field createDateFieldFactory(
      {String label,
      String helperText,
      bool isRequired = false,
      Function(String text) onChanged}) {
    return Field(
      label: label,
      helperText: helperText,
      isRequired: isRequired,
      mask: kDateMask,
      onChanged: onChanged,
    );
  }

  static Field createNameFieldFactory(
      {String label,
      String helperText,
      bool isRequired,
      Function(String text) onChanged}) {
    return Field(
      label: label,
      helperText: helperText,
      isRequired: isRequired,
      mask: null,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatters;
    if (mask != null) {
      formatters = <TextInputFormatter>[
        MaskTextInputFormatter(mask: mask, filter: {"#": RegExp(r'[0-9]')})
      ];
    } else {
      formatters = <TextInputFormatter>[];
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: formatters,
        onChanged: (text) => onChanged(text),
        textCapitalization: TextCapitalization.words,
        validator: isRequired ? emptynessValidator : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
            helperText: helperText),
      ),
    );
  }
}
