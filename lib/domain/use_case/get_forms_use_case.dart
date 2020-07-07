import 'package:maisdata/domain/repository/repository.dart';
import 'package:maisdata/presentation/widgets/form_model.dart';

mixin GetFormsUseCase {
  Future<List<FormModel>> call();
}

class GetForms implements GetFormsUseCase {
  final Repository repository;

  GetForms(this.repository);

  @override
  Future<List<FormModel>> call() {
    return repository.getForms();
  }
}
