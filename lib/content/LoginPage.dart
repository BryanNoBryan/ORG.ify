import 'package:flutter/material.dart';
import 'package:midyear/MyNavigator.dart';

import '../UserState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
            child: Text(
          'LoginPage',
          style: TextStyle(fontSize: 30),
        )),
        TextButton(
            onPressed: () {
              UserState.perm = 1;
              MyNavigator.goHome();
            },
            child: Text(
              'Admin',
              style: TextStyle(fontSize: 30),
            )),
        TextButton(
            onPressed: () {
              UserState.perm = 0;
              MyNavigator.goHome();
            },
            child: Text(
              'User',
              style: TextStyle(fontSize: 30),
            )),
      ],
    ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   int selectedIndex = 0;
//   int selectedOption = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [Colors.green, Colors.yellow]),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 200,
//             ),
//             SizedBox(
//                 height: 150, child: SvgPicture.asset('assets/svg/medal.svg')),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ListTile(
//                   title: const Text('Option 1'),
//                   leading: Radio(
//                     value: 1,
//                     groupValue: selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedOption = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: const Text('Option 2'),
//                   leading: Radio(
//                     value: 2,
//                     groupValue: selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedOption = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   int selectedIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(colors: [Colors.green, Colors.yellow]),
// //         ),
// //         child: Center(child: Text("Home")),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.lightbulb),
// //             label: 'Volunteer',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person),
// //             label: 'Profile',
// //           ),
// //         ],
// //         onTap: (idx) {
// //           setState(() {
// //             selectedIndex = idx;
// //             if (idx == 1) {
// //               context.go('/page2');
// //             }
// //           });
// //         },
// //         currentIndex: selectedIndex,
// //       ),
// //     );
// //   }
// // }
