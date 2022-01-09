import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/list_items.dart';
import '../models/shopping_list.dart';

class DbHelper {
  final int version = 1;
  late Database db;

  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }

  //opendb (create database)
  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
        database.execute(
            'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT,' +
                'FOREIGN KEY(idList) REFERENCES lists(id))');
      }, version: version);
    }
    return db;
  }

  //testDB
  Future testDb() async {
    db = await openDb();
    //data dummy lists table
    await db.execute('INSERT INTO lists VALUES(0,"FRUITS",2)');
    //data dummy items table
    await db.execute(
        'INSERT INTO items VALUES(0,0,"APPLES","2 Kg","better if they are green")');
    List lists = await db.rawQuery('SELECT * FROM lists');
    List items = await db.rawQuery('SELECT * FROM items');
    print(lists[0].toString());
    print(items[0].toString());
  }

  //insert data shopping list
  Future<int> insertList(ShoppingList list) async {
    int id = await db.insert('lists', list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //insert data listItem
  Future<int> insertItems(ListItems item) async {
    int id = await db.insert('items', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //getLISTS
  Future<List<ShoppingList>> getLists() async {
    final List<Map<String, dynamic>> maps = await db.query('lists');
    return List.generate(maps.length, (i) {
      return ShoppingList(maps[i]['id'], maps[i]['name'], maps[i]['priority']);
    });
  }

  //get items
  Future<List<ListItems>> getItems(int idList) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'items',
      where: 'idList = ?',
      whereArgs: [idList],
    );
    return List.generate(
      maps.length,
      (i) {
        return ListItems(
          maps[i]['id'],
          maps[i]['idList'],
          maps[i]['name'],
          maps[i]['quantity'],
          maps[i]['note'],
        );
      },
    );
  }
}
