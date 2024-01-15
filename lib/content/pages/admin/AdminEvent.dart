import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/content/widgets/AddEventDialog.dart';
import 'package:midyear/content/widgets/ViewEventDialog.dart';
import 'package:midyear/database/EventDB.dart';
import 'package:midyear/database/data/Event.dart';
import 'package:midyear/navigation/MyNavigator.dart';

class AdminEvent extends StatefulWidget {
  const AdminEvent({super.key});

  @override
  State<AdminEvent> createState() => _AdminEventState();
}

class _AdminEventState extends State<AdminEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Events',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.normal),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            const AddEventDialog(),
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Col.lightBlue,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: EventDB().retrieveElem(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Event>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, position) {
                                return eventElement(
                                    context, snapshot, position);
                              });
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }

  GestureDetector eventElement(
      BuildContext context, AsyncSnapshot<List<Event>> snapshot, int position) {
    return GestureDetector(
      onTap: () async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => ViewEventDialog(
            event: snapshot.data![position],
          ),
        );
        setState(() {});
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          EventDB().deleteElem(snapshot.data![position].eventId!);
          setState(() {});
        },
        direction: DismissDirection.horizontal,
        child: Container(
            height: 170,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Col.lightBlue,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            snapshot.data![position].title,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Text(
                            snapshot.data![position].username,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        MyNavigator.router.push(MyNavigator.adminViewSignUp,
                            extra: snapshot.data![position]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(width: 10, color: Colors.white),
                        ),
                        child: Icon(Icons.person, size: 30),
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    snapshot.data![position].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 79, 79, 79)),
                  ),
                ),
              ],
            )),

        // AnnouncementBox(
        //   id: snapshot.data![position].eventId!,
        //   title: snapshot.data![position].title,
        //   description:
        //       snapshot.data![position].description,
        //   onPressed: () async {
        //     setState(() {});
        //   },
        // ),
      ),
    );
  }
}
