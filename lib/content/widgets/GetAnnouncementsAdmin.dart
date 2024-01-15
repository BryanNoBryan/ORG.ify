import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:midyear/content/widgets/AnnouncementBox.dart';
import 'package:midyear/content/widgets/ViewAnnouncementDialog.dart';
import 'package:midyear/database/AnnouncementDB.dart';
import 'package:midyear/database/data/Announcements.dart';

class GetAnnouncementsAdmin extends StatefulWidget {
  const GetAnnouncementsAdmin({
    super.key,
  });

  @override
  State<GetAnnouncementsAdmin> createState() => _GetAnnouncementsAdminState();
}

class _GetAnnouncementsAdminState extends State<GetAnnouncementsAdmin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AnnouncementDB().retrieveElem(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Announcement>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          log('built');

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) async {
                    await AnnouncementDB()
                        .deleteElem(snapshot.data![position].id!);
                    setState(() {});
                  },
                  direction: DismissDirection.horizontal,
                  child: AnnouncementBox(
                    id: snapshot.data![position].id!,
                    title: snapshot.data![position].title,
                    description: snapshot.data![position].description,
                    onPressed: () async {
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            ViewAnnnouncementDialog(
                          announcement: snapshot.data![position],
                        ),
                      );
                      setState(() {});
                    },
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
