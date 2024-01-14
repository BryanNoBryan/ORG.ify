import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/navigation/MyNavigator.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: MyNavigator.navigationbarIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              log((index == widget.child.currentIndex).toString());
              MyNavigator.goHome(
                  initial: index == MyNavigator.navigationbarIndex);
              break;
            case 1:
              MyNavigator.goEvent(
                  initial: index == MyNavigator.navigationbarIndex);
              break;
            case 2:
              MyNavigator.goProfile(
                  initial: index == MyNavigator.navigationbarIndex);
              break;
          }
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
