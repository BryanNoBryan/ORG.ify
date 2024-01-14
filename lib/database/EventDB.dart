import 'dart:async';

import 'package:midyear/database/data/Event.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EventDB {
  static final EventDB _databaseHelper = EventDB._();

  EventDB._();

  late Database db;

  factory EventDB() {
    return _databaseHelper;
  }

  static const String name = 'event';

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, '$name.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE $name (
              eventId INTEGER PRIMARY KEY AUTOINCREMENT, 
              username TEXT NOT NULL,
              title TEXT NOT NULL,
              description TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertElem(Event elem) async {
    int result = await db.insert('$name', elem.toMap());
    return result;
  }

  Future<int> updateElem(Event elem) async {
    int result = await db.update(
      '$name',
      elem.toMap(),
      where: "eventId = ?",
      whereArgs: [elem.eventId],
    );
    return result;
  }

  Future<List<Event>> retrieveElem() async {
    final List<Map<String, Object?>> queryResult = await db.query('$name');
    return queryResult.map((e) => Event.fromMap(e)).toList().reversed.toList();
  }

  Future<void> deleteElem(int eventId) async {
    await db.delete(
      '$name',
      where: "eventId = ?",
      whereArgs: [eventId],
    );
  }
}
