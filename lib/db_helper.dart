import 'package:custom_wish_list/classes/item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  static const _databaseName = 'itemDb.db';
  static const _databaseVersion = 1;
  static const table = 'item';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnPrice = 'price';

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnName TEXT NOT NULL,
          $columnPrice REAL NOT NULL
        )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, Object?>>?> items() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }

  Future<void> updateItem(Item item) async {
    Database? db = await instance.database;

    await db?.update(
      table,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(Item item) async {
    Database? db = await instance.database;

    await db?.delete(
      table,
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
}
