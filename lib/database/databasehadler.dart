import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path_provider/path_provider.dart';

class DatabaseHandler {
  factory DatabaseHandler() {
    return _databasehandler;
  }
  static final DatabaseHandler _databasehandler = DatabaseHandler._internal();
  static Database? _database;

  DatabaseHandler._internal();
  Future<Database?> openDB() async {
    final docsPath = await getApplicationDocumentsDirectory();
    final dbPath = join(docsPath.path, 'demo.db');
    final db = await openDatabase(dbPath);
    _database = db;

    return _database;
  }
}
