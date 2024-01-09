import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/content/widgets/AnnouncementBox.dart';
import 'package:midyear/content/widgets/GetAnnouncementsUser.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/widgetAssets/Headline.dart';
import 'package:midyear/content/widgets/AddAnnnouncementDialog.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            MyNavigator.router.pop();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Announcements',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Expanded(
              child: GetAnnouncementsUser(),
            ),
          ],
        ),
      ),
    );
  }
}
