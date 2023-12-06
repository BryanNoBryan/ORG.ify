import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midyear/HomePage.dart';
import 'package:midyear/admin/AdminHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            name:
                'home', // Optional, add name to your routes. Allows you navigate by name instead of path
            path: '/',
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            name: 'page2',
            path: '/page2',
            builder: (context, state) => AdminHome(),
          ),
        ],
      ),
      title: 'Midyear App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
    );
  }
}
