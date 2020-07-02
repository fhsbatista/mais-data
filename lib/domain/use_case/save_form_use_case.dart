import 'package:maisdata/domain/repository/repository.dart';
import 'package:maisdata/presentation/widgets/form_model.dart';

mixin SaveFormUseCase {
  Future<void> call(String cityName);
}

class SaveForm implements SaveFormUseCase {
  final Repository repository;
  final FormModel form;

  SaveForm(this.repository, this.form);

  @override
  Future<void> call(String cityName) async {
    return await repository.saveForm(form);
  }
}
