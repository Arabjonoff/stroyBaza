import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance =  DatabaseHelper.internal();
  factory DatabaseHelper() => instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'stroybaza');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {

    /// Region Base
    await db.execute('''
          CREATE TABLE region (
            id INTEGER PRIMARY KEY,
            name TEXT,
            is_active TEXT
          )
          ''');

    /// District Base
    await db.execute('''
          CREATE TABLE district (
            id INTEGER PRIMARY KEY,
            name TEXT,
            clametor INTEGER,
            is_active TEXT,
            region INTEGER
          )
          ''');

    /// Order Base
    await db.execute(
        '''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY,
        count REAL,
        name TEXT,
        image TEXT,
        price REAL
      )
       ''');

    /// Client Base
    await db.execute('''
          CREATE TABLE clients(
            id INTEGER,
            district INTEGER,
            fio TEXT,
            phone TEXT,
            telegram_id TEXT,
            address TEXT,
            latitude REAL,
            longitude REAL
          )
          ''');
  }

  Future<void> deleteDatabase()async{
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'stroybaza');
    return databaseFactory.deleteDatabase(path);
  }
}