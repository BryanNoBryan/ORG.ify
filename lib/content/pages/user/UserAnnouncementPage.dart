import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/content/widgets/announcement.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/widgetAssets/Headline.dart';
import 'package:midyear/content/widgets/MyAlertDialog.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Announcements',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Col.lightBlue,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => MyAlertDialog(),
                      );
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: FakeData.announcements.length,
                  itemBuilder: (context, index) {
                    return Announcement(
                      title: FakeData.announcements[index][0],
                      description: FakeData.announcements[index][1],
                      onPressed: () => (),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
