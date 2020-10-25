import 'package:maisdata/model/form_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:maisdata/model/field.dart';
import 'dart:convert';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  final String formsTable = 'forms_table';
  final String colId = 'id';
  final String colTitle = 'title';
  final String colFields = 'fields';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async => await openDatabase(
        join(await getDatabasesPath(), 'maisdata.db'),
        version: 1,
        onCreate: _createDb,
      );

  _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $formsTable('
      '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$colTitle TEXT,'
      '$colFields TEXT'
      ')',
    );
  }

  Future<List<Map<String, dynamic>>> getFormsMapList() async {
    final db = await this.db;
    return db.query(formsTable);
  }

  Future<List<FormModel>> getFormsList() async {
    try {
      final tasksMap = await getFormsMapList();
      final list = tasksMap.map((map) => FormModel.fromMap(map)).toList();
      return list;
    } catch (error) {
      print(error);
    }
  }

  Future<int> insertForm(FormModel form) async {
    final db = await this.db;
    return await db.insert(formsTable, form.toMap());
  }

  Future<int> updateForm(FormModel form) async {
    final db = await this.db;
    final result = await db.update(
      formsTable,
      form.toMap(),
      where: '$colId = ?',
      whereArgs: [form.id],
    );
    return result;
  }

  Future<int> deleteForm(FormModel form) async {
    final db = await this.db;
    return await db.delete(
      formsTable,
      where: '$colId = ? ',
      whereArgs: [form.id],
    );
  }
}
