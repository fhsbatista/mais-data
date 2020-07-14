import 'package:maisdata/data/data_source/local/local_data_source.dart';
import 'package:maisdata/domain/repository/repository.dart';
import 'package:maisdata/model/form_model.dart';

class AppRepository implements Repository {
  final LocalDataSource localDataSource;

  AppRepository(this.localDataSource);

  @override
  Future<void> saveForm(FormModel form) {
    return localDataSource.saveForm(form);
  }

  @override
  Future<List<FormModel>> getForms() {
    return localDataSource.getForms();
  }
}
