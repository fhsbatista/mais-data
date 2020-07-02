import 'package:maisdata/presentation/widgets/form_model.dart';

abstract class LocalDataSource {
  Future<void> saveForm(FormModel form);
}
