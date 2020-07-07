import 'package:maisdata/presentation/widgets/form_model.dart';

abstract class Storage {
  Future<void> saveForm(FormModel form);
  Future<List<FormModel>> getForms();
}
