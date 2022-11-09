import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skeleton_prototype/components/field_text.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';


class BodySignup extends StatefulWidget {
  const BodySignup({Key? key}) : super(key: key);

  @override
  _BodySignupState createState() => _BodySignupState();
}


class _BodySignupState extends State<BodySignup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              "Welcome to medicalife",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              "assets/icons/img_3.png",
              height: size.height*0.45,
              width: size.width*0.45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 5.0),
                  child: Text(
                    "Username:",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Fieldtext(visibility: true, label: "e.g. Joe Abey", hint: "Enter Your Username"),
                Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 5.0, top: 5.0),
                  child: Text(
                    "Password:",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Fieldtext(visibility: false, label: "e.g. ******", hint: "Enter you password"),
                Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 5.0, top: 5.0),
                  child: Text(
                    "Email Adress:",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Fieldtext(visibility: true, label: "e.g. example@email.com", hint: "Enter your email"),
                Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 5.0, top: 5.0),
                  child: Text(
                    "Phone Number:",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                // Fieldtext(visibility: true, label: "e.g. +0 123 456", hint: "Enter your Phone Number"),
                InternationalPhoneNumberInput(
                  onInputChanged: (value) {},

                ),
                Center(
                  child: RoundedButton(
                    color: kPrimaryColor,
                    press: () {},
                    text: "Register",
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
