import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/content/widgets/AddEventDialog.dart';
import 'package:midyear/content/widgets/ViewEventDialog.dart';
import 'package:midyear/database/EventDB.dart';
import 'package:midyear/database/SignUpDB.dart';
import 'package:midyear/database/data/Event.dart';
import 'package:midyear/database/data/SignUp.dart';
import 'package:midyear/navigation/UserState.dart';

class UserEvent extends StatefulWidget {
  const UserEvent({super.key});

  @override
  State<UserEvent> createState() => _UserEventState();
}

class _UserEventState extends State<UserEvent> {
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.normal),
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     await showDialog<String>(
                  //       context: context,
                  //       builder: (BuildContext context) => AddEventDialog(),
                  //     );
                  //     setState(() {});
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Col.lightBlue,
                  //     ),
                  //     child: const Icon(
                  //       Icons.add,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
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
                                return GestureDetector(
                                  onTap: () async {
                                    await showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ViewEventDialog(
                                        event: snapshot.data![position],
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) {
                                      EventDB().deleteElem(
                                          snapshot.data![position].eventId!);
                                      setState(() {});
                                    },
                                    direction: DismissDirection.horizontal,
                                    child: Container(
                                        height: 170,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Col.lightBlue,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        snapshot.data![position]
                                                            .title,
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        snapshot.data![position]
                                                            .username,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                FutureBuilder(
                                                  future:
                                                      SignUpDB().retrieveElem(),
                                                  builder:
                                                      (context, snapshot2) {
                                                    if (snapshot2.hasData) {
                                                      bool signedUpAlready = snapshot2
                                                          .data!
                                                          .where((e) =>
                                                              e.eventId ==
                                                                  snapshot
                                                                      .data![
                                                                          position]
                                                                      .eventId &&
                                                              e.username ==
                                                                  UserState
                                                                      .name)
                                                          .isNotEmpty;

                                                      String testS = '';
                                                      snapshot2.data!
                                                          .where((e) =>
                                                              e.eventId ==
                                                                  snapshot
                                                                      .data![
                                                                          position]
                                                                      .eventId &&
                                                              e.username ==
                                                                  UserState
                                                                      .name)
                                                          .forEach((e) =>
                                                              testS +=
                                                                  e.username);

                                                      log(testS);
                                                      log(signedUpAlready
                                                          .toString());

                                                      return GestureDetector(
                                                        onTap: () async {
                                                          if (!signedUpAlready) {
                                                            SignUp su = SignUp(
                                                                eventId: snapshot
                                                                    .data![
                                                                        position]
                                                                    .eventId!,
                                                                username:
                                                                    UserState
                                                                        .name);
                                                            SignUpDB()
                                                                .insertElem(su);
                                                          } else {
                                                            SignUpDB().deleteElem(snapshot2
                                                                .data!
                                                                .firstWhere((e) =>
                                                                    e.username ==
                                                                    UserState
                                                                        .name)
                                                                .id!);
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                width: 10,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          child: signedUpAlready
                                                              ? Icon(
                                                                  Icons.close,
                                                                  size: 30)
                                                              : Icon(Icons.add,
                                                                  size: 30),
                                                        ),
                                                      );
                                                    } else {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                snapshot.data![position]
                                                    .description,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color.fromARGB(
                                                        255, 79, 79, 79)),
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
}
