import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'data/Attendance.dart';

class AttendanceDB {
  static final AttendanceDB _databaseHelper = AttendanceDB._();

  AttendanceDB._();

  late Database db;

  factory AttendanceDB() {
    return _databaseHelper;
  }

  static const String name = 'attendance';

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, '$name.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE $name (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              username TEXT NOT NULL,
              time TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertElem(Attendance elem) async {
    int result = await db.insert('$name', elem.toMap());
    return result;
  }

  Future<int> updateElem(Attendance elem) async {
    int result = await db.update(
      '$name',
      elem.toMap(),
      where: "id = ?",
      whereArgs: [elem.id],
    );
    return result;
  }

  Future<List<Attendance>> retrieveElem() async {
    final List<Map<String, Object?>> queryResult = await db.query('$name');
    return queryResult
        .map((e) => Attendance.fromMap(e))
        .toList()
        .reversed
        .toList();
  }

  Future<void> deleteElem(int id) async {
    await db.delete(
      '$name',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
