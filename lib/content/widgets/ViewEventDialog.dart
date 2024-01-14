import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/database/AnnouncementDB.dart';
import 'package:midyear/database/data/Announcements.dart';
import 'package:midyear/database/data/Event.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/widgetAssets/Input.dart';

class ViewEventDialog extends StatefulWidget {
  const ViewEventDialog({required this.event, super.key});

  final Event event;

  @override
  State<ViewEventDialog> createState() => _ViewEventDialogState();
}

class _ViewEventDialogState extends State<ViewEventDialog> {
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);
  late final TextEditingController description =
      TextEditingController(text: widget.event.description);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: 450,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 3.5,
            ),
            Text(widget.event.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            Text(widget.event.username,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: primaryColor, spreadRadius: 1),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    readOnly: true,
                    controller: description,
                    minLines: 4,
                    maxLines: 12,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            const SizedBox(
              height: 3.5,
            ),
          ],
        ),
      ),
    );
  }
}
