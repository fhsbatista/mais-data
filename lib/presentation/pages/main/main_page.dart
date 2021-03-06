import 'package:flutter/material.dart';
import 'package:maisdata/presentation/pages/home/home.dart';
import 'package:maisdata/presentation/pages/manage_forms/manage_forms_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int _selectedScreenIndex = 0;
  final _screens = [
    HomePage(),
    ManageFormsPage(),
  ];

  _onBottomNavigationTapped(int itemTappedIndex) {
    setState(() {
      _selectedScreenIndex = itemTappedIndex;
    });
  }

  _onError(String error) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error)));
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
