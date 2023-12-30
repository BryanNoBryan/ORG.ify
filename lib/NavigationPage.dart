import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/MyNavigator.dart';

import 'UserState.dart';

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
      appBar: AppBar(
        title: const Text('amogus inc.'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 40),
            onPressed: () {
              MyNavigator.loginScreen();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: MyNavigator.navigationbarIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              MyNavigator.goHome(initial: index == widget.child.currentIndex);
              break;
            case 1:
              MyNavigator.goEvent(initial: index == widget.child.currentIndex);
              break;
            case 2:
              MyNavigator.goProfile(
                  initial: index == widget.child.currentIndex);
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
