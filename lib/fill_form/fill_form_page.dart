import 'package:flutter/material.dart';
import 'package:maisdata/widgets/Form.dart' as my;
import 'package:url_launcher/url_launcher.dart';

class FillFormPage extends StatefulWidget {
  final my.Form form;

  FillFormPage({@required this.form});

  @override
  _FillFormPageState createState() => _FillFormPageState(form);
}

class _FillFormPageState extends State<FillFormPage> {
  final my.Form form;

  _FillFormPageState(this.form);

  String _data = "";
  String _hora = "";
  String _frota = "";
  String _tanque = "";
  String _frentista = "";
  String _hodometro = "";
  String _litros = "";
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
                    _sendEmail(_hora, _frota, _tanque, _frentista, _hodometro,
                        _litros);
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
              children: form.fields,
            ),
          ),
        ),
      ),
    );
  }

  void _sendEmail(String hora, String frota, String tanque,
      String nomeDoFrentista, String hodometro, String litros) async {
    StringBuffer subjectBuffer = StringBuffer();
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
