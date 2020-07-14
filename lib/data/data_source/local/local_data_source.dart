import 'package:maisdata/model/form_model.dart';

abstract class LocalDataSource {
  Future<void> saveForm(FormModel form);
  Future<List<FormModel>> getForms();
}
