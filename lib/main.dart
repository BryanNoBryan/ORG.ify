import 'package:flutter/material.dart';
import 'navigation/MyNavigator.dart';

void main() {
  MyNavigator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyNavigator.router,
      title: 'Midyear App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),

      //INDEPENDENT SHELLS FOR EACH BOT NAV BAR + LOGIN CREATED
      //NOW ADD ADDITIONAL LOGIC ON TOP
      //CHANGE getPage method to take additional parameter(int -> want login or main pages) SO ADDITIONAL CLASS LIKE NavigationPage but LoginPage, or remove the appbar and bottomnavbar entirely(nah we don't want copy 6 times)
      //ADD LOGIC THAT to know if Admin or User at start, and choose between User and Admin pages thru that parameter, probably use a map
      //NO BETTER TO DO A SINGLETON CLASS THAT HOLDS IF USER VS ADMIN DATA
    );
  }
}

// final _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       name:
//           'home', // Optional, add name to your routes. Allows you navigate by name instead of path
//       path: '/',
//       builder: (context, state) => HomePage(),
//     ),
//     GoRoute(
//       name: 'page2',
//       path: '/page2',
//       builder: (context, state) => AdminHome(),
//     ),
//   ],
// );
