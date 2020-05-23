import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maisdata/shared/field_validators.dart';
import 'package:maisdata/shared/formatters.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

class FillFormPage extends StatefulWidget {
  @override
  _FillFormPageState createState() => _FillFormPageState();
}

class _FillFormPageState extends State<FillFormPage> {
  String hora = "";
  String frota = "";
  String tanque = "";
  String frentista = "";
  String hodometro = "";
  String litros = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preencher formulário'),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _sendEmail(
                        hora, frota, tanque, frentista, hodometro, litros);
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
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      MaskTextInputFormatter(
                          mask: '##:##', filter: {"#": RegExp(r'[0-9]')})
                    ],
                    keyboardType: TextInputType.datetime,
                    onChanged: (text) {
                      hora = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hora',
                        helperText:
                            'O horário em que o abastecimetento foi feito'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      frota = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Número da frota',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      tanque = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tanque',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      frentista = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do frentista',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    inputFormatters: [DecimalNumberFormatter(hundreds: 1)],
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      hodometro = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hodômetro',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    inputFormatters: [DecimalNumberFormatter(hundreds: 1)],
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      litros = text;
                    },
                    validator: emptynessValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Litros',
                    ),
                  ),
                )
              ],
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
