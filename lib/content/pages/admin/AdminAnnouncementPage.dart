import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/content/widgets/GetAnnouncementsAdmin.dart';
import 'package:midyear/content/widgets/AddAnnnouncementDialog.dart';
import 'package:midyear/navigation/MyNavigator.dart';

class AdminAnnouncementPage extends StatefulWidget {
  const AdminAnnouncementPage({super.key});

  @override
  State<AdminAnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AdminAnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            MyNavigator.router.pop();
            setState(() {});
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
                        builder: (BuildContext context) =>
                            const AddAnnnouncementDialog(),
                      );
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            //!!!!!!!IMPORTANT!!!!!!!!!!!
            // LESSON LEARNED - DO NOOOOOOT MAKE THIS CONST
            // THIS WILL CAUSE THE FUTUREBUILDER TO NOT UPDATE
            Expanded(
              child: GetAnnouncementsAdmin(),
            ),
          ],
        ),
      ),
    );
  }
}
