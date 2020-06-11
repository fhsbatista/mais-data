import 'dart:math';

import 'fields/Field.dart';

class FormModel {
  final String title;
  final List<Field> fields;

  FormModel({this.title, this.fields});

  String getImageUrl() {
    final randomId = Random().nextInt(200);
    return "https://i.picsum.photos/id/$randomId/500/500.jpg?blur=1";
  }
}
