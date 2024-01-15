import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/database/SignUpDB.dart';
import 'package:midyear/database/data/Event.dart';
import 'package:midyear/database/data/SignUp.dart';
import 'package:midyear/navigation/MyNavigator.dart';

class ViewSignUp extends StatefulWidget {
  const ViewSignUp({required this.event, super.key});

  final Event event;

  @override
  State<ViewSignUp> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<ViewSignUp> {
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
                Text(
                  'Signed Up for ${widget.event.title}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            FutureBuilder(
              future: SignUpDB().retrieveElem(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SignUp> list = snapshot.data!;
                  list = list
                      .where((e) => e.eventId == widget.event.eventId)
                      .toList();

                  return Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, position) {
                          return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Col.lightBlue,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      list[position].username,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ));
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
