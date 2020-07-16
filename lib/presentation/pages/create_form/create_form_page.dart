import 'package:flutter/material.dart';
import 'package:maisdata/data/data_source/local/app_local_data_source.dart';
import 'package:maisdata/data/repository/app_repository.dart';
import 'package:maisdata/data/storage/app_storage.dart';
import 'package:maisdata/domain/use_case/save_form_use_case.dart';
import 'package:maisdata/model/field.dart';
import 'package:maisdata/model/form_model.dart';
import 'package:maisdata/presentation/pages/create_form/add_field.dart';

class CreateFormPage extends StatefulWidget {
  @override
  _CreateFormPageState createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Field> _fields = List<Field>();
  ScrollController _scrollController = ScrollController();

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
      _fields.add(field);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  _deleteField(int index) {
    setState(() {
      _fields.removeAt(index);
    });
  }

  _saveForm() async {
    final form = FormModel(title: 'Formulário teste', fields: _fields);
    final useCase = SaveForm(
      AppRepository(
        AppLocalDataSource(
          AppStorage(),
        ),
      ),
    );
    await useCase
        .call(form)
        .then((value) => Navigator.of(context).pop())
        .catchError(
            (dynamic error) => _onSaveFormError(error as ArgumentError));
  }

  _onSaveFormError(ArgumentError error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Criar Formuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              size: Theme.of(context).appBarTheme.actionsIconTheme.size,
            ),
            color: Theme.of(context).accentIconTheme.color,
            onPressed: _saveForm,
          )
        ],
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: _fields.length,
          itemBuilder: (context, index) {
            return _fields[index].toCard(index, () => _deleteField(index));
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
              title: Text('${this.label}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text('Tipo: ${this.type.getDescription()}')),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text('Dica: ${this.helper}')),
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
