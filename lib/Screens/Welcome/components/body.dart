import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_prototype/Screens/Welcome/components/background.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Text(
          "WELCOME TO MEDICALIFE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // SvgPicture.asset(
        //   "assets/icons/chat.svg",
        //   height: size.height * 0.4,
        // ),
        RoundedButton(
          text: "LOGIN",
          color: kPrimaryColor,
          press: () { },
        ),
        RoundedButton(
          text: "SignUp",
          color: kPrimaryLightColor,
          textColor: kPrimaryColor,
          press: () { },
        ),
      ],
    ),
    );
  }
}


