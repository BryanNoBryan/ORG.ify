import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/content/widgets/AnnouncementBox.dart';
import 'package:midyear/content/widgets/GetAnnouncementsUser.dart';
import 'package:midyear/database/AttendanceDB.dart';
import 'package:midyear/database/data/Attendance.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/navigation/UserState.dart';
import 'package:midyear/widgetAssets/Headline.dart';
import 'package:midyear/widgetAssets/OutlineBtn1.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 300,
        toolbarHeight: 70,
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: OutlineBtn1(
            text: UserState.organizationID,
            onPressed: () => MyNavigator.loginScreen(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${UserState.name}!',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        '${UserState.perms[UserState.perm]}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  // IconButton(icon: icon,onPressed: iconOnPressed,)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  bool alreadyTookAttendance =
                      (await AttendanceDB().retrieveElem())
                          .where((e) => e.time.day == DateTime.now().day)
                          .isNotEmpty;

                  if (!alreadyTookAttendance) {
                    await AttendanceDB().insertElem(Attendance(
                        username: UserState.name, time: DateTime.now()));
                    setState(() {});
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Col.lightBlue,
                        ),
                        child: const Text(
                          "Mark Attendance",
                          style: TextStyle(
                            color: Color(0xff15BE77),
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder(
                      future: AttendanceDB().retrieveElem(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              child: (snapshot.data!
                                      .where((e) =>
                                          e.time.day == DateTime.now().day)
                                      .isEmpty)
                                  ? Icon(Icons.close)
                                  : Icon(Icons.check));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Headline(
                  title: 'Announcements',
                  onPressed: () async {
                    await MyNavigator.router
                        .push(MyNavigator.userAnnouncementPath);
                    setState(() {});
                  }),
              const Divider(
                thickness: 5,
              ),
              GetAnnouncementsUser(),
            ],
          ),
        ),
      ),
    );
  }
}
