import 'package:flutter/material.dart';
import 'package:maisdata/pages/create_form/create_form_page.dart';
import 'package:maisdata/shared/styles/text.dart';

import "../../shared/extensions.dart";

class ManageFormsPage extends StatefulWidget {
  @override
  _ManageFormsPageState createState() => _ManageFormsPageState();
}

class _ManageFormsPageState extends State<ManageFormsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlatButton(
          child: Text(
            'Criar formulário',
            style: kTitle,
          ),
          onPressed: () => context.openPage(CreateFormPage()),
        ),
        FlatButton(
          child: Text(
            'Importar por QRCode',
            style: kTitle,
          ),
        )
      ],
    ));
  }
}
