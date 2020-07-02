import 'package:maisdata/presentation/widgets/form_model.dart';

abstract class Repository {
  Future<void> saveForm(FormModel form);
}
