import 'package:flutter/material.dart';
import 'package:maisdata/pages/fill_form/fill_form_page.dart';
import 'package:maisdata/shared/styles/text.dart';
import 'package:maisdata/widgets/form_model.dart';

import '../../forms.dart';

class HomePage extends StatefulWidget {
  final List<FormModel> forms;

  HomePage({@required this.forms});

  @override
  _HomePageState createState() => _HomePageState(forms: forms);
}

class _HomePageState extends State<HomePage> {
  List<FormModel> forms;

  _HomePageState({@required this.forms});

  void navigateToFuelForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FillFormPage(
          form: FormModel(
            title: 'Abastecimento',
            fields: fuelFields,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mais Data',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Qual formulário você quer enviar?',
                style: kTitle,
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: forms.map((form) => form.toCard()).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on FormModel {
  Container toCard() => Container(
        margin: EdgeInsets.only(top: 12),
        child: Card(
          color: Color(0xffa0a8ff),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 90,
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          elevation: 4,
        ),
      );
}