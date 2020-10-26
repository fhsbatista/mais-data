import 'package:maisdata/domain/repository/repository.dart';
import 'package:maisdata/model/form_model.dart';

class SaveFormUsecase {
  final Repository repository;

  SaveFormUsecase(this.repository);

  Future<void> call(FormModel form) async {
    //TODO implement an Either that contains a failure to return errors
    if (form.title.isEmpty || form.fields.isEmpty) {
      return;
    }
    return await repository.saveForm(form);
  }
}
