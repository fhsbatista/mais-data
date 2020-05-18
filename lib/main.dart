import 'package:flutter/material.dart';
import 'package:maisdata/fill_form/fill_form_page.dart';
import 'package:maisdata/shared/colors.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor:  kAccentColor,
        ),
        title: 'Mais Data',
        home: FillFormPage(),
      
      ),
    );
