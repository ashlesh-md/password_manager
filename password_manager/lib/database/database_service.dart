import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'model/site.dart';
import 'model/user.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._privateConstructor();

  DatabaseService._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _upgrade);
  }

  _upgrade(Database db, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) db.execute("ALTER TABLE User ADD AGE INTEGER");
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE Site (id INTEGER PRIMARY KEY AUTOINCREMENT,userid INTEGER, url TEXT, siteName TEXT, notes TEXT ,sector TEXT, socialMedia Text ,username Text ,password Text,FOREIGN KEY(userid) REFERENCES User(id))');
      await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, phone_number TEXT NOT NULL, password TEXT NOT NULL)');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<User>> getAllUser() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM User');
    return result.length > 0
        ? result.map((json) => User.fromJson(json)).toList()
        : [];
  }

  Future<User> getUser(int id) async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM User WHERE id=${id}');

    return result.map((json) => User.fromJson(json)).toList()[0];
  }

  Future getUserByData(String mobileNumber, String mPin) async {
    final db = await instance.database;
    final result = await db.rawQuery(
        'SELECT * FROM User WHERE phone_number = ? ;', [mobileNumber]);
    if (result.isEmpty) {
      return 'Account does not exist';
    } else if (result[0]['password'] == mPin) {
      return 'Sign In successfull';
    } else {
      return 'Incorrect Password';
    }
  }

  Future createUser(Map<String, dynamic> user) async {
    final db = await instance.database;

    try {
      int result = await db.insert('User', user);

      return "Record inserted";
    } catch (e) {
      return Exception("Something went wrong");
    }
  }

  Future updateUser(Map<String, dynamic> user) async {
    final db = await instance.database;

    try {
      int result = await db
          .update('User', user, where: 'id = ?', whereArgs: [user["id"]]);

      return "Record updated";
    } catch (e) {
      return Exception("Something went wrong");
    }
  }

  Future deleteUser(int id) async {
    final db = await instance.database;

    try {
      int result = await db.delete('User', where: 'id = ?', whereArgs: [id]);

      return "Record deleted";
    } catch (e) {
      return Exception("Something went wrong");
    }
  }

  Future<List<Site>> getAllSite() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Site');
    print("Site is ${result}");
    return result.length > 0
        ? result.map((json) => Site.fromJson(json)).toList()
        : [];
  }

  Future<List> getAllSitesToDisplay() async {
    List data = [];
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Site');
    print("Site is ${result}");
    result.forEach((element) {
      data.add(element);
    });
    return data;
  }

  Future<Site> getSite(int id) async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Site WHERE id=${id}');

    return result.map((json) => Site.fromJson(json)).toList()[0];
  }

  Future<List<Site>> getDataByCategory(String category) async {
    final db = await instance.database;

    final result =
        await db.rawQuery('SELECT * FROM Site WHERE sector="${category}"');
    print("Site is ${result}");
    return result.length > 0
        ? result.map((json) => Site.fromJson(json)).toList()
        : [];
  }

  Future createSite(Map<String, dynamic> Site) async {
    final db = await instance.database;

    try {
      int result = await db.insert('Site', Site);

      return "Record inserted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future updateSite(Map<String, dynamic> Site) async {
    final db = await instance.database;

    try {
      int result = await db
          .update('Site', Site, where: 'id = ?', whereArgs: [Site["id"]]);

      return "Record updated";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future deleteSite(int id) async {
    final db = await instance.database;

    try {
      int result = await db.delete('Site', where: 'id = ?', whereArgs: [id]);

      return "Record deleted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }
}
