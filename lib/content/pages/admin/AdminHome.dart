import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/content/widgets/GetAnnouncementsAdmin.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/navigation/UserState.dart';
import 'package:midyear/widgetAssets/Headline.dart';
import 'package:midyear/widgetAssets/OutlineBtn1.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                onTap: () {
                  MyNavigator.router.push(MyNavigator.adminViewAttendance);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Col.lightBlue,
                    ),
                    child: const Text(
                      "View Attendance",
                      style: TextStyle(
                        color: Color(0xff15BE77),
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Headline(
                title: 'Announcements',
                onPressed: () async {
                  await MyNavigator.router
                      .push(MyNavigator.adminAnnouncementPath);
                  setState(() {});
                },
              ),
              const Divider(
                thickness: 5,
              ),
              //old test data
              // ...List.generate(
              //   3,
              //   (index) => AnnouncementBox(
              //     id: 0,
              //     title: FakeData.announcements[index][0],
              //     description: FakeData.announcements[index][1],
              //     onPressed: () => (),
              //   ),
              // ),
              const GetAnnouncementsAdmin(),
            ],
          ),
        ),
      ),
    );
  }
}

//SvgPicture.asset('assets/svg/medal.svg'),
