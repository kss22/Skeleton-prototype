import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Entity/entity_screen.dart';
import 'package:skeleton_prototype/Screens/Welcome/welcome_screen.dart';
import 'package:skeleton_prototype/constants.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => WelcomeScreen(),
    '/entity': (context) => EntityScreen(),
  },
));

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // routes: {
//       //   '/': (context) => WelcomeScreen(),
//       //   '/entity': (context) => EntityScreen(),
//       // },
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }