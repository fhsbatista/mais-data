import 'package:flutter/material.dart';
import 'package:maisdata/model/form_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/field.dart';

class FillFormPage extends StatefulWidget {
  final FormModel form;

  FillFormPage({@required this.form});

  @override
  _FillFormPageState createState() => _FillFormPageState(form);
}

class _FillFormPageState extends State<FillFormPage> {
  final FormModel form;

  _FillFormPageState(this.form);

  final _data = TextEditingController();
  final _hora = TextEditingController();
  final _frota = TextEditingController();
  final _tanque = TextEditingController();
  final _frentista = TextEditingController();
  final _hodometro = TextEditingController();
  final _litros = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(form.title),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _sendEmail(
                        _data.text,
                        _hora.text,
                        _frota.text,
                        _tanque.text,
                        _frentista.text,
                        _hodometro.text,
                        _litros.text);
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Preencha todos os campos'),
                      duration: Duration(milliseconds: 1000),
                    ));
                  }
                }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children:
                  form.fields.map((field) => field.toFieldWidget()).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _sendEmail(String data, String hora, String frota, String tanque,
      String nomeDoFrentista, String hodometro, String litros) async {
    StringBuffer subjectBuffer = StringBuffer();
    subjectBuffer.writeln("Data: $data");
    subjectBuffer.writeln("Hora: $hora");
    subjectBuffer.writeln("Frota: $frota");
    subjectBuffer.writeln("Tanque: $tanque");
    subjectBuffer.writeln("Nome do Frentista: $nomeDoFrentista");
    subjectBuffer.writeln("Hodômetro: $hodometro");
    subjectBuffer.writeln("Litros: $litros");

    String body = subjectBuffer.toString();

    String url =
        "mailto:<fernandohsbatista@gmail.com>?subject=<teste>&body=$body";

    await launch(url);
  }
}
