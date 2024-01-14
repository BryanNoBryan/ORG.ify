import 'dart:async';

import 'package:midyear/database/data/SignUp.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SignUpDB {
  static final SignUpDB _databaseHelper = SignUpDB._();

  SignUpDB._();

  late Database db;

  factory SignUpDB() {
    return _databaseHelper;
  }

  static const String name = 'signUp';

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, '$name.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE $name (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              eventId INTEGER NOT NULL,
              username TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertElem(SignUp elem) async {
    int result = await db.insert('$name', elem.toMap());
    return result;
  }

  Future<int> updateElem(SignUp elem) async {
    int result = await db.update(
      '$name',
      elem.toMap(),
      where: "id = ?",
      whereArgs: [elem.id],
    );
    return result;
  }

  Future<List<SignUp>> retrieveElem() async {
    final List<Map<String, Object?>> queryResult = await db.query('$name');
    return queryResult.map((e) => SignUp.fromMap(e)).toList().reversed.toList();
  }

  Future<void> deleteElem(int id) async {
    await db.delete(
      '$name',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
