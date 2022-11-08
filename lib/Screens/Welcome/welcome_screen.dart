import 'package:flutter/material.dart';
import 'package:skeleton_prototype/constants.dart';

import 'components/body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryLightBackColor,
      body: Body(),
    );
  }
}
