import 'package:flutter/material.dart';
import 'package:maisdata/fill_form/fill_form_page.dart';
import 'package:maisdata/shared/colors.dart';
import 'package:maisdata/widgets/Form.dart' as my;
import 'package:maisdata/widgets/fields/Field.dart';

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
              (FieldBuilder()
                    ..isRequired = true
                    ..setLabel('Data do abastecimento')
                    ..setDateFormatter())
                  .build(),
              (FieldBuilder()
                    ..isRequired = true
                    ..setLabel('Nome do frentista'))
                  .build(),
              (FieldBuilder()
                    ..isRequired = true
                    ..setLabel('Nome do Motorista'))
                  .build(),
              (FieldBuilder()
                    ..isRequired = true
                    ..setLabel('Hodômetro')
                    ..setDecimalFormatter())
                  .build()
            ],
          ),
        ),
      ),
    );
