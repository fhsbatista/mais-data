import 'dart:convert';

import 'package:maisdata/model/field.dart';

class FormModel {
  int id;
  final String title;
  final List<Field> fields;

  FormModel({this.title, this.fields});
  FormModel.withId({this.id, this.title, this.fields});

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'title': title,
      'fields': Field.toJsonList(fields),
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static FormModel fromMap(Map<String, dynamic> map) {
    final List fieldsJson = jsonDecode(map['fields']);
    return FormModel.withId(
      id: map['id'],
      title: map['title'],
      fields: fieldsJson.map((e) => Field.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'Title: ${this.title}';
  }
}
