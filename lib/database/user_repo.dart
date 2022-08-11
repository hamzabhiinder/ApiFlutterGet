import 'dart:html';

import 'package:sqflite/sqflite.dart';

class UserRepo {
  void createTable(Database? db) {
    db?.execute("""CREATE TABLE "User" (
	"id"	INTEGER,
	"name"	TEXT,
	"email"	TEXT,
	"age"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
); """);
  }

  // ignore: non_constant_identifier_names
  Future<List<Map<String, dynamic>>> getUsers(Database? db) async {
    final List<Map<String, dynamic>> maps = await db!.query('User');

    return maps;
  }
}
