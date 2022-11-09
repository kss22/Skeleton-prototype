import 'package:flutter/material.dart';
import 'package:skeleton_prototype/components/field_text.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';

class BodyLogIn extends StatefulWidget {
  const BodyLogIn({Key? key}) : super(key: key);

  @override
  _BodyLogInState createState() => _BodyLogInState();
}

class _BodyLogInState extends State<BodyLogIn> {
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
          SizedBox(height: 50,),
          Image.asset(
            "assets/icons/img_3.png",
            height: size.height*0.2,
            ),
            SizedBox(height: 50,),
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
              Fieldtext(visibility: true, label: "e.g. Joe Abey", hint: "Enter Your Username", cap: TextCapitalization.words),
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
              Fieldtext(visibility: false, label: "e.g. ******", hint: "Enter you password", cap: TextCapitalization.none),
              // SizedBox(height: 10, ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                  child: RoundedButton(
                      text: "Submit",
                      press: (){}
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
