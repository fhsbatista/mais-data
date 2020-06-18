import 'package:flutter/material.dart';
import 'package:maisdata/pages/create_form/add_field.dart';
import 'package:maisdata/widgets/fields/Field.dart';

class CreateFormOverviewPage extends StatefulWidget {
  @override
  _CreateFormOverviewPageState createState() => _CreateFormOverviewPageState();
}

class _CreateFormOverviewPageState extends State<CreateFormOverviewPage> {
  List<Field> fields = List<Field>();
  ScrollController scrollController = ScrollController();

  _displayCreateFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Fechar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      AddField(
                        onSubmit: (field) {
                          _addField(field);
                        },
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }

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

  _deleteField(int index) {
    setState(() {
      fields.removeAt(index);
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
            return fields[index].toCard(index, () => _deleteField(index));
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          _displayCreateFormModal(context);
        },
      ),
    );
  }
}

extension on Field {
  Card toCard(int index, Function() onDelete) {
    return Card(
      elevation: 12,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
                      child: Text('Tipo: ${this.getTypeDescription()}')),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text('Dica: ${this.getHelper()}')),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          (this.isRequired) ? 'Obrigatório' : 'Opcional',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: (this.isRequired)
                                  ? Colors.red
                                  : Colors.green),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: onDelete,
                        )
                      ],
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
