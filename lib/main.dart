import 'package:flutter/material.dart';
import 'package:maisdata/pages/main/main_page.dart';
import 'package:maisdata/shared/colors.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'SF UI Display',
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
        ),
        title: 'Mais Data',
        home: MainPage(),
      ),
    );
