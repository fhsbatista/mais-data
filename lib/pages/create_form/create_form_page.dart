import 'package:flutter/material.dart';
import 'package:maisdata/shared/styles/text.dart';

class CreateFormPage extends StatefulWidget {
  @override
  _CreateFormPageState createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Criar formulário',
        style: kTitle,
      ),
    );
  }
}
