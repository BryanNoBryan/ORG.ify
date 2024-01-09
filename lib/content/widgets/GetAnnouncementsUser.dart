import 'package:flutter/material.dart';
import 'package:midyear/content/widgets/AnnouncementBox.dart';
import 'package:midyear/database/AnnouncementDB.dart';
import 'package:midyear/database/data/Announcements.dart';

class GetAnnouncementsUser extends StatelessWidget {
  const GetAnnouncementsUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AnnouncementDB().retrieveElem(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Announcement>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return AnnouncementBox(
                  id: snapshot.data![position].id!,
                  title: snapshot.data![position].title,
                  description: snapshot.data![position].description,
                  onPressed: () {},
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
