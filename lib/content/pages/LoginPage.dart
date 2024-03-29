import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';
import 'package:midyear/FakeData.dart';
import 'package:midyear/navigation/MyNavigator.dart';

import '../../navigation/UserState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController organization = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fractal.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            // const SizedBox(
            //   height: 100,
            // ),
            AnimatedAlign(
              alignment: Alignment.bottomCenter,
              curve: Curves.easeInCirc,
              heightFactor: 2.0,
              widthFactor: 1.0,
              duration: const Duration(seconds: 3),
              child: Center(
                  child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: const Text(
                  'ORG.ify',
                  style: TextStyle(fontSize: 50),
                ),
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: organization,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.only(
                      start: 30, top: 20, bottom: 20),
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Organization ID",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 93, 152, 254),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 32.0, color: Col.lightBlue),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: username,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.only(
                      start: 30, top: 20, bottom: 20),
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Username",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 93, 152, 254),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 32.0, color: Col.lightBlue),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: password,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.only(
                      start: 30, top: 20, bottom: 20),
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Password",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 93, 152, 254),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 32.0, color: Col.lightBlue),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  loginAttempt();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Col.lightBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                ),
                child: const Text('Log In', style: TextStyle(fontSize: 30)),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    ));
  }

  void loginAttempt() {
    int? perm = FakeData.login(username.text, password.text, organization.text);
    log(username.text);
    log(password.text);
    log(organization.text);
    log(perm.toString());
    if (perm != null) {
      UserState.perm = perm;
      UserState.organizationID = organization.text;
      UserState.name = username.text;
      UserState.pw = password.text;
      username.text = '';
      password.text = '';
      MyNavigator.goHome();
    } else {
      username.text = 'Try Again.';
      password.text = '';
    }
  }
}
