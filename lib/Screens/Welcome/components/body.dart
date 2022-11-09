import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Welcome/components/background.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';



class BodyWelcome extends StatefulWidget {
  const BodyWelcome({Key? key}) : super(key: key);

  @override
  _BodyWelcomeState createState() => _BodyWelcomeState();
}
class _BodyWelcomeState extends State<BodyWelcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget> [
        SizedBox(height: 180),
        Text(
          "WELCOME TO MEDICALIFE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        SizedBox(height: 80),
        Image.asset(
          "assets/icons/img_3.png",
          height: size.height * 0.2,
        ),
        SizedBox(height: 80),
        RoundedButton(
          text: "LOGIN",
          color: kPrimaryColor,
          //TODO determine function
          press: () {},
        ),
        RoundedButton(
          text: "SignUp",
          color: kPrimaryLightColor,
          textColor: kPrimaryColor,
          //TODO determine function
          press: () {
            Navigator.pushNamed(context, '/entity');
          },
        ),
      ],
    ),
    );
  }
}


