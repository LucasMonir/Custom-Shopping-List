import 'package:custom_wish_list/classes/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static const _databaseName = 'itemDb.db';
  static const _databaseVersion = 1;

  static const table = 'item';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnPrice = 'price';

  late Database _db;

  Future<void> init() async {
    const directory = 'lib/db';
    final path = join(directory, _databaseName);
    _db = await openDatabase(path,
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
    return await _db.insert(
      table,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> items() async {
    final List<Map<String, dynamic>> list = await _db.query('item');
    return List.generate(list.length, (i) {
      return Item(
        name: list[i]['name'],
        price: list[i]['price'],
        id: list[i]['id'],
      );
    });
  }

  Future<void> updateItem(Item item) async {
    await _db.update(
      table,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(Item item) async {
    await _db.delete(
      table,
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
}
