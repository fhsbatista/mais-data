import 'package:flutter/material.dart';
import 'package:maisdata/pages/home/home.dart';
import 'package:maisdata/pages/manage_forms/manage_forms_page.dart';
import 'package:maisdata/widgets/form_model.dart';

import '../../forms.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreenIndex = 0;
  final _screens = [
    HomePage(forms: forms),
    ManageFormsPage(),
  ];

  _onBottomNavigationTapped(int itemTappedIndex) {
    setState(() {
      _selectedScreenIndex = itemTappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mais Data',
          ),
        ),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          unselectedItemColor: Color(0x80ffffff),
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              title: Text('Enviar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Gerenciar'),
            ),
          ],
          onTap: (index) => _onBottomNavigationTapped(index),
        ));
  }
}

final forms = [
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
];
