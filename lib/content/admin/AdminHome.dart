import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'AdminHome',
      style: TextStyle(fontSize: 30),
    )));
  }
}

//SvgPicture.asset('assets/svg/medal.svg'),