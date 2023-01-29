import 'dart:io';
import 'package:custom_wish_list/classes/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join('lib\\db\\', _databaseName);
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

  Future<int> insert(Item item) async {
    Database? db = await instance.database;

    return await db!.insert(
      table,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> items() async {
    Database? db = await instance.database;

    final List<Map<String, dynamic>> list = await db!.query('item');
    return List.generate(list.length, (i) {
      return Item(
        name: list[i]['name'],
        price: list[i]['price'],
        id: list[i]['id'],
      );
    });
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
