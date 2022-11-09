import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Signup/components/body.dart';
import 'package:skeleton_prototype/constants.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: kPrimaryColor,
      ),
      body: BodySignup(),
    );
  }
}
