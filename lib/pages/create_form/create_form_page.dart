import 'package:flutter/material.dart';
import 'package:maisdata/widgets/fields/Field.dart';

class CreateFormPage extends StatefulWidget {
  @override
  _CreateFormPageState createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  List<Field> fields = List<Field>();
  ScrollController scrollController = ScrollController();

  _addField(Field field) {
    setState(() {
      fields.add(field);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Formuário'),
      ),
      body: ListView.builder(
          controller: scrollController,
          itemCount: fields.length,
          itemBuilder: (context, index) {
            return fields[index].toCard();
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          final field = (FieldBuilder()
                ..setLabel('Nome do Produto')
                ..isRequired = false)
              .build();
          _addField(field);
        },
      ),
    );
  }
}

extension on Field {
  Card toCard() {
    return Card(
      elevation: 12,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('${this.getLabel()}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text('Tipo: ${this.getHint()}')),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text('Dica: ${this.getHint()}')),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      (this.isRequired) ? 'Obrigatório' : 'Opcional',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (this.isRequired) ? Colors.red : Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
