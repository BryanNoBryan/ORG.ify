import 'package:flutter/material.dart';
import 'package:midyear/database/AnnouncementDB.dart';
import 'package:midyear/database/AttendanceDB.dart';
import 'package:midyear/database/EventDB.dart';
import 'package:midyear/database/SignUpDB.dart';
import 'package:midyear/gsheets/GSheetsAPI.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'navigation/MyNavigator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  MyNavigator();

  WidgetsFlutterBinding.ensureInitialized();

  // databaseFactory.deleteDatabase(join(await getDatabasesPath(), 'event.db'));
  // databaseFactory.deleteDatabase(join(await getDatabasesPath(), 'signUp.db'));

  await AnnouncementDB().initDB();
  await AttendanceDB().initDB();
  await EventDB().initDB();
  await SignUpDB().initDB();

  await GSheetsAPI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      routerConfig: MyNavigator.router,
      title: 'ORG.ify',
    );
  }
}
