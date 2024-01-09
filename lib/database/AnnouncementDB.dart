import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'data/Announcements.dart';

class AnnouncementDB {
  static final AnnouncementDB _databaseHelper = AnnouncementDB._();

  AnnouncementDB._();

  late Database db;

  factory AnnouncementDB() {
    return _databaseHelper;
  }

  static final String name = 'announcement';

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, '$name.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE $name (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              title TEXT NOT NULL,
              description TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertElem(Announcement elem) async {
    int result = await db.insert('$name', elem.toMap());
    return result;
  }

  Future<int> updateElem(Announcement elem) async {
    int result = await db.update(
      '$name',
      elem.toMap(),
      where: "id = ?",
      whereArgs: [elem.id],
    );
    return result;
  }

  Future<List<Announcement>> retrieveElem() async {
    final List<Map<String, Object?>> queryResult = await db.query('$name');
    return queryResult
        .map((e) => Announcement.fromMap(e))
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
