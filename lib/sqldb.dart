import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get getdb async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'todo.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    await db.execute('''
  CREATE TABLE "deletedtodolist" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "title" TEXT NOT NULL,
    "subtitle" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "color" INTEGER NOT NULL
  )
  ''');
    print("onUpgrade ======");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "todo" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "title" TEXT NOT NULL,
    "subtitle" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "color" INTEGER NOT NULL
  )
 ''');

    await db.execute('''
  CREATE TABLE "deletedtodolist" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "title" TEXT NOT NULL,
    "subtitle" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "color" INTEGER NOT NULL
  )
  ''');
    print(" onCreate ===============");
  }

  readData(String sql) async {
    Database? mydb = await getdb;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await getdb;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await getdb;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await getdb;
    int response = await mydb!.rawDelete(sql);
    return response;
  }


}
