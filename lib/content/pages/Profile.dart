import 'package:flutter/material.dart';
import 'package:midyear/navigation/MyNavigator.dart';
import 'package:midyear/widgetAssets/OutlinedBtn2.dart';

import '../../navigation/UserState.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'ORG.ify',
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fractal.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Hi ${UserState.name}!",
                    style: const TextStyle(
                        fontSize: 40, backgroundColor: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    UserState.organizationID,
                    style: const TextStyle(
                        fontSize: 30, backgroundColor: Colors.white),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 250,
                    child: OutlinedBtn2(
                        text: 'Sign Out',
                        onPressed: () => MyNavigator.loginScreen()),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
