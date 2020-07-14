import 'dart:async';

import 'package:maisdata/data/storage/storage.dart';
import 'package:maisdata/model/form_model.dart';

import '../../forms.dart';

class AppStorage implements Storage {
  @override
  Future<void> saveForm(FormModel form) {
    print('Form saved successfully: $form');
    return Future.value();
  }

  @override
  Future<List<FormModel>> getForms() {
    return Future.delayed(
        Duration(seconds: 3),
        () => Future.value([
              FormModel(
                title: 'Abastecimento',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Baixa de estoque',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Despesa externa',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Troca de pneu',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Troca de óleo',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Troca de óleo',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Troca de óleo',
                fields: fuelFields,
              ),
              FormModel(
                title: 'Troca de óleo',
                fields: fuelFields,
              ),
            ]));
  }
}
