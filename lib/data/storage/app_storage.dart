import 'dart:async';

import 'package:maisdata/data/storage/storage.dart';
import 'package:maisdata/helpers/database_helper.dart';
import 'package:maisdata/model/form_model.dart';

class AppStorage implements Storage {
  @override
  Future<void> saveForm(FormModel form) {
    return DatabaseHelper.instance.insertForm(form);
  }

  @override
  Future<List<FormModel>> getForms() {
    return DatabaseHelper.instance.getFormsList();
  }
}
