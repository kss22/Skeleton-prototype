import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Home/components/home_body.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/Login/components/login_field_text.dart';
import 'package:skeleton_prototype/Screens/Signup/user_signup_screen.dart';
import 'package:skeleton_prototype/components/field_text.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skeleton_prototype/constants.dart';

class BodyLogIn extends StatefulWidget {
  const BodyLogIn({Key? key}) : super(key: key);


  @override
  _BodyLogInState createState() => _BodyLogInState();
}

class _BodyLogInState extends State<BodyLogIn> {

  // String error = "Forgot password?";
  // Color errorColor = kPrimaryLightColor;
  // String message = " Reset";
  bool wrongPassword = false;
  bool wrongUsername = false;
  bool isTooMany = false;
  // Function inkwellFun = () {
  //   //TODO set reset
  // };

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print(e.code);

      }
    }
    return user;
  }



  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user?.uid ?? "";

    final DatabaseReference database = FirebaseDatabase.instance.reference();

    DatabaseReference userMedsRef = database.child('users').child(uid).child('uid');

    void addMed(String uid) {
      userMedsRef.push().set(uid);
    }

    //Create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/icons/img_3.png",
            height: size.height * 0.2,
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isTooMany) Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Too many tries. Try agian later",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  "Email Address:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              if (wrongUsername)
                ErrorFieldtext(
                  errorMessage: "Wrong email",
                  controllers: _emailController,
                  label: "e.g. Joe Abey",
                  hint: "Enter Your Username",
                  cap: TextCapitalization.words,
                  visibility: true,
                ),
              if (!wrongUsername)
                Fieldtext(
                  cap: TextCapitalization.none,
                  controllers: _emailController,
                  label: "e.g. Joe Abey",
                  hint: "Enter Your Username",
                  visibility: true,
                ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 5.0),
                child: Text(
                  "Password:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              if (wrongPassword)
                ErrorFieldtext(
                    errorMessage: "Wrong password",
                    controllers: _passwordController,
                    visibility: false,
                    label: "e.g. ******",
                    hint: "Enter you password",
                    cap: TextCapitalization.none),
              if (!wrongPassword)
                Fieldtext(
                    controllers: _passwordController,
                    visibility: false,
                    label: "e.g. ******",
                    hint: "Enter you password",
                    cap: TextCapitalization.none),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot your passwrod?",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      " Reset",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    onTap: (){
                      //TODO reset password
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                child: RoundedButton(
                    text: "Login",
                    press: () async {
                      //let's test the app
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);

                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                        // Navigator.of(context).pushNamedAndRemoveUntil('/home' , (_) => false);
                        // Navigator.pushNamedAndRemoveUntil('/home', (_) => false);
                        // Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        try {
                          UserCredential userCredential = await auth.signInWithEmailAndPassword(
                              email: _emailController.text, password: _passwordController.text);
                          user = userCredential.user;
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            wrongUsername = false;
                            wrongPassword = false;
                            isTooMany = false;
                          });
                          print(e.code);
                          if(e.code == "user-not-found"){
                            setState(() {
                              wrongUsername = true;
                            });
                          }
                          else if (e.code == "wrong-password") {
                            setState(() {
                              wrongPassword = true;
                            });
                          }
                          else if(e.code == "invalid-email"){
                            setState(() {
                              wrongUsername = true;
                            });
                          }
                          else if(e.code == "unknown"){
                            setState(() {
                              wrongUsername = true;
                              wrongPassword = true;
                            });
                          }
                          else if(e.code == "too-many-requests"){
                            wrongUsername = true;
                            isTooMany = true;
                          }
                        }
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                alignment: Alignment.center,
                child: RoundedButton(
                    text: "Signup",
                    color: kPrimaryLightColor,
                    textColor: kPrimaryColor,
                    press: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SignupScreen()));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
