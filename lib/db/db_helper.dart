import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  static final DbHelper _instance = new DbHelper._internal();
  factory DbHelper () => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentDirectory();
    String path = join(documentDirectory.path, "main.db"); 
  }

  DbHelper._internal();
}