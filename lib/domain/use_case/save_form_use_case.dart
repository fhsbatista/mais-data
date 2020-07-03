import 'package:maisdata/domain/repository/repository.dart';
import 'package:maisdata/presentation/widgets/form_model.dart';

mixin SaveFormUseCase {
  Future<void> call(FormModel form);
}

class SaveForm implements SaveFormUseCase {
  final Repository repository;

  SaveForm(this.repository);

  @override
  Future<void> call(FormModel form) async {
    return await repository.saveForm(form);
  }
}
