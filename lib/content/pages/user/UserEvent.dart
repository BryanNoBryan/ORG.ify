import 'package:flutter/material.dart';

class UserEvent extends StatefulWidget {
  const UserEvent({super.key});

  @override
  State<UserEvent> createState() => _UserEventState();
}

class _UserEventState extends State<UserEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'UserEvent',
      style: TextStyle(fontSize: 30),
    )));
  }
}
