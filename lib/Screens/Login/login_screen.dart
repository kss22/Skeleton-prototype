import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login/components/body.dart';
import 'package:skeleton_prototype/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: kPrimaryColor,
      ),
      body: BodyLogIn(),

    );
  }
}
