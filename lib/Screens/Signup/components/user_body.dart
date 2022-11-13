import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/Login/components/login_field_text.dart';
import 'package:skeleton_prototype/Screens/Login/login_screen.dart';
import 'package:skeleton_prototype/components/field_text.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

class UserBodySignup extends StatefulWidget {
  const UserBodySignup({Key? key}) : super(key: key);

  @override
  _UserBodySignupState createState() => _UserBodySignupState();
}

class _UserBodySignupState extends State<UserBodySignup> {
  bool wrongPassword = false;
  bool wrongUsername = false;
  bool wrongEmail = false;

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
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
            // width: size.width*0.45,
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  "Username:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              if (!wrongUsername)
                Fieldtext(
                    controllers: _nameController,
                    visibility: true,
                    label: "e.g. Joe Abey",
                    hint: "Enter Your Username",
                    cap: TextCapitalization.words),
              if (wrongUsername)
                ErrorFieldtext(
                    errorMessage: "Invalid name",
                    controllers: _nameController,
                    visibility: true,
                    label: "e.g. Joe Abey",
                    hint: "Enter your username",
                    cap: TextCapitalization.words),
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
              if (!wrongPassword)
                Fieldtext(
                    controllers: _passwordController,
                    visibility: false,
                    label: "e.g. ******",
                    hint: "Enter you password",
                    cap: TextCapitalization.none),
              if (wrongPassword)
                ErrorFieldtext(
                    errorMessage: "Invalid Password",
                    controllers: _passwordController,
                    visibility: false,
                    label: "e.g. ******",
                    hint: "Enter you password",
                    cap: TextCapitalization.none),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 5.0),
                child: Text(
                  "Email Adress:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              if (!wrongEmail)
                Fieldtext(
                  controllers: _emailController,
                  visibility: true,
                  label: "e.g. example@email.com",
                  hint: "Enter your email",
                  cap: TextCapitalization.none,
                ),
              if (wrongEmail)
                ErrorFieldtext(
                  errorMessage: "Invalid email",
                  controllers: _emailController,
                  visibility: true,
                  label: "e.g. example@email.com",
                  hint: "Enter your email",
                  cap: TextCapitalization.none,
                ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 5.0),
                child: Text(
                  "Phone Number:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              // Fieldtext(visibility: true, label: "e.g. +0 123 456", hint: "Enter your Phone Number"),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0, right: 30.0),
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You already have an account?"),
                  InkWell(
                    child: Text(
                      'Signin',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              ),
              Center(
                child: RoundedButton(
                  color: kPrimaryColor,
                  press: () async {
                    //let's test the app
                    User? user = await registerUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                    );
                    print(user);

                    RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                    setState(() {
                      wrongUsername = false;
                      wrongPassword = false;
                      wrongEmail = false;
                    });
                    if(user != null){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }
                    FirebaseAuth auth = FirebaseAuth.instance;

                    try {
                      UserCredential test =
                          await auth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        setState(() {
                          wrongPassword = true;
                        });
                      } else if (e.code == 'email-already-in-use') {
                        setState(() {
                          wrongEmail = true;
                        });
                      } else if (e.code == 'invalid-email') {
                        setState(() {
                          wrongEmail = true;
                        });
                      }
                      else if (e.code == 'unknown' &&
                          _nameController.text.isEmpty && _passwordController.text.isEmpty && _emailController.text.isEmpty) {
                        setState(() {
                          wrongPassword = true;
                          wrongEmail = true;
                          wrongUsername = true;
                        });
                      } else if (e.code == 'unknown' &&
                          _nameController.text.isEmpty && !_passwordController.text.isEmpty && !_emailController.text.isEmpty) {
                        setState(() {
                          wrongPassword = true;
                          wrongEmail = true;
                          wrongUsername = false;
                        });
                      } else if (e.code == 'unknown' &&
                          _passwordController.text.isEmpty && !_emailController.text.isEmpty && !_nameController.text.isEmpty) {
                        setState(() {
                          wrongPassword = false;
                          wrongEmail = true;
                          wrongUsername = true;
                        });
                      } else if (e.code == 'unknown' &&
                          !_passwordController.text.isEmpty && _emailController.text.isEmpty && !_nameController.text.isEmpty) {
                        setState(() {
                          wrongPassword = true;
                          wrongEmail = false;
                          wrongUsername = true;
                        });
                      } else if (e.code == 'unknown' &&
                          _passwordController.text.isEmpty && _emailController.text.isEmpty && !_nameController.text.isEmpty) {
                        setState(() {
                          wrongPassword = true;
                          wrongEmail = true;
                          wrongUsername = false;
                        });
                      }
                      else if (e.code == 'unknown' &&
                          !_passwordController.text.isEmpty && _emailController.text.isEmpty && _nameController.text.isEmpty) {
                        setState(() {
                          wrongPassword = false;
                          wrongEmail = true;
                          wrongUsername = true;
                        });
                      } else if (e.code == 'unknown' &&
                          _passwordController.text.isEmpty && !_emailController.text.isEmpty && _nameController.text.isEmpty) {
                        setState(() {
                          wrongPassword = true;
                          wrongEmail = false;
                          wrongUsername = true;
                        });
                      }
                      print(e.code);
                    }
                  },
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
