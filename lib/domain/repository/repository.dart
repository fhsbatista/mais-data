import 'package:maisdata/model/form_model.dart';

abstract class Repository {
  Future<void> saveForm(FormModel form);
  Future<List<FormModel>> getForms();
}
