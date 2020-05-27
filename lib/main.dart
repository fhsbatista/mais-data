import 'package:flutter/material.dart';
import 'package:maisdata/fill_form/fill_form_page.dart';
import 'package:maisdata/shared/colors.dart';
import 'package:maisdata/widgets/DateField.dart';
import 'package:maisdata/widgets/Form.dart' as my;

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
        ),
        title: 'Mais Data',
        home: FillFormPage(
          form: my.Form(
            title: 'Abastecimento',
            fields: [
              DateField(
                label: 'Data 1',
                helperText: 'Digite aqui amigo',
                onChanged: null,
                isRequired: true,
              ),
              DateField(
                label: 'Data 1',
                helperText: 'Digite aqui amigo',
                onChanged: null,
                isRequired: true,
              ),
              DateField(
                label: 'Data 1',
                helperText: 'Digite aqui amigo',
                onChanged: null,
                isRequired: true,
              ),
              DateField(
                label: 'Data 1',
                helperText: 'Digite aqui amigo',
                onChanged: null,
                isRequired: false,
              ),
              DateField(
                label: 'Data 1',
                helperText: 'Digite aqui amigo',
                onChanged: null,
                isRequired: false,
              ),
            ],
          ),
        ),
      ),
    );
