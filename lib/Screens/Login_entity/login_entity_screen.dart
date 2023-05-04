import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login_entity/components/body.dart';
import 'package:skeleton_prototype/constants.dart';

class LoginEntityScreen extends StatefulWidget {
  const LoginEntityScreen({Key? key}) : super(key: key);

  @override
  _LoginEntityScreenState createState() => _LoginEntityScreenState();
}

class _LoginEntityScreenState extends State<LoginEntityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: kPrimaryColor,
      ),
      body: BodyEntity(),
    );
  }
}
