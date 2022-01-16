import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  static Database? _db = null;
  DataBaseHelper._instance();
  String noteTable = "note_table";
  String colId = "id";
  String colTitle = "title";
  String colDate = "date";
  String colPriority = "priority";
  String colStatus = "status";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  //buat db
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todo_list.db";
    final todoListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDB;
  }

  //create table
  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId, INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colPriority TEXT, $colStatus INTEGER)');
  }

  //get Notetable
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(noteTable);
    return result;
  }
}
