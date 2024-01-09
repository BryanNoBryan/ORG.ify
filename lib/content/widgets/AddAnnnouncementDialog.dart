import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/database/AnnouncementDB.dart';
import 'package:midyear/database/data/Announcements.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/widgetAssets/Input.dart';

class AddAnnnouncementDialog extends StatefulWidget {
  const AddAnnnouncementDialog({Key? key}) : super(key: key);

  @override
  State<AddAnnnouncementDialog> createState() => _AddAnnnouncementDialogState();
}

class _AddAnnnouncementDialogState extends State<AddAnnnouncementDialog> {
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: 400,
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
            const Text("New Announcement",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Input(title: 'Title', controller: title)),
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
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: description,
                    minLines: 4,
                    maxLines: 8,
                  ),
                )),
            const SizedBox(
              height: 3.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                    text: "Submit",
                    onPressed: () async {
                      FakeData.announcements
                          .insert(0, [title.text, description.text]);
                      Announcement ann = Announcement(
                          title: title.text, description: description.text);
                      await AnnouncementDB().insertElem(ann);
                      Navigator.of(context).pop();
                    }),
                SimpleBtn1(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  invertedColors: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
