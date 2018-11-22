import 'package:hello_world/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

// Singleton class
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

  DbHelper._internal();

  initDb() async {
    String path = getPath();
    var dbHandle = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbHandle;
  }

  getPath() async {
    String dbPath = await getDatabasesPath();
    return join(dbPath, "main.db"); 
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)');
    print('Table is created');
  }

  void closeDb() async {
    if (_db != null) {
      await _db.close();
    }
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert('User', user.toMap());
    return res;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete('User');
    return res;
  }

  // void deleteDb() async {
  //   String path = getPath();
  //   await deleteDatabase(path);
  // }
}