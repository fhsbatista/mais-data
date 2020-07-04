import 'package:maisdata/data/data_source/local/local_data_source.dart';
import 'package:maisdata/data/storage/storage.dart';
import 'package:maisdata/presentation/widgets/form_model.dart';

class AppLocalDataSource implements LocalDataSource {
  final Storage storage;

  AppLocalDataSource(this.storage);

  @override
  Future<void> saveForm(FormModel form) {
    return storage.saveForm(form);
  }
}
