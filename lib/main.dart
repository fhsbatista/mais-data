import 'package:flutter/material.dart';
import 'package:maisdata/forms.dart';
import 'package:maisdata/shared/colors.dart';
import 'package:maisdata/widgets/form_model.dart';

import 'pages/home/home.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'SF UI Display',
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
        ),
        title: 'Mais Data',
        home: HomePage(forms: [
          FormModel(
            title: 'Abastecimento',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Baixa de estoque',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Despesa externa',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Troca de pneu',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Troca de óleo',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Troca de óleo',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Troca de óleo',
            fields: fuelFields,
          ),
          FormModel(
            title: 'Troca de óleo',
            fields: fuelFields,
          ),
        ]),
      ),
    );
