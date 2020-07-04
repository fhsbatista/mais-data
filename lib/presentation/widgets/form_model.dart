import 'fields/Field.dart';

class FormModel {
  final String title;
  final List<Field> fields;

  FormModel({this.title, this.fields});

  @override
  String toString() {
    return 'Title: ${this.title}';
  }
}
