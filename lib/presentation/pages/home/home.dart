import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maisdata/data/data_source/local/app_local_data_source.dart';
import 'package:maisdata/data/repository/app_repository.dart';
import 'package:maisdata/data/storage/app_storage.dart';
import 'package:maisdata/domain/use_case/get_forms_use_case.dart';
import 'package:maisdata/model/form_model.dart';
import 'package:maisdata/presentation/pages/fill_form/fill_form_page.dart';
import 'package:maisdata/shared/extensions.dart';
import 'package:maisdata/shared/styles/text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetFormsUseCase getFormsUsecase = GetForms(
    AppRepository(
      AppLocalDataSource(
        AppStorage(),
      ),
    ),
  );

  List<FormModel> _forms = [];

  _HomePageState();

  @override
  void initState() {
    super.initState();
    _setForms();
  }

  void _setForms() async {
    await getFormsUsecase()
        .then((value) => setState(() => _forms = value))
        .catchError((error) => _onError(error));
  }

  void _onError(dynamic msg) {
    // widget.onError(msg.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
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
                children: _forms.isNotEmpty
                    ? _forms.map((form) => form.toCard(context)).toList()
                    : [Center(child: Text('Não existem formulários salvos'))],
              ))
        ],
      ),
    );
  }
}

extension on FormModel {
  Container toCard(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 12),
        child: InkWell(
          onTap: () => context.openPage(FillFormPage(form: this)),
          child: Card(
            color: Theme.of(context).accentColor,
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
        ),
      );
}
