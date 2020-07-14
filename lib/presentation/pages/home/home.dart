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
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetFormsUseCase useCase = GetForms(
    AppRepository(
      AppLocalDataSource(
        AppStorage(),
      ),
    ),
  );

  List<FormModel> forms = [];

  _HomePageState();

  @override
  void initState() {
    super.initState();
    _setForms();
  }

  void _setForms() async {
    final persistedForms = await useCase.call();
    setState(() {
      forms = persistedForms;
    });
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
              children: forms.map((form) => form.toCard(context)).toList(),
            ),
          )
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
