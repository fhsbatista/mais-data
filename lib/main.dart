import 'package:flutter/material.dart';
import 'package:maisdata/presentation/pages/main/main_page.dart';
import 'package:maisdata/shared/colors.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'SF UI Display',
          primaryColor: kPrimaryColor,
          primaryColorDark: kPrimaryDarkColor,
          accentColor: kAccentColor,
        ),
        title: 'Mais Data',
        home: MainPage(),
      ),
    );
