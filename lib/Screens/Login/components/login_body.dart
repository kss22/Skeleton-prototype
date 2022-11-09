import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/components/field_text.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BodyLogIn extends StatefulWidget {
  const BodyLogIn({Key? key}) : super(key: key);

  @override
  _BodyLogInState createState() => _BodyLogInState();
}

class _BodyLogInState extends State<BodyLogIn> {

  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if (e.code == "user-not-found"){
        print("No user found for this email");
      }
    }

    return user;
  }
  
  @override
  Widget build(BuildContext context) {

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
                  "Email Address:",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Fieldtext(controllers: _emailController, label: "e.g. Joe Abey", hint: "Enter Your Username", cap: TextCapitalization.words, visibility: true,),
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
              Fieldtext(controllers: _passwordController,visibility: false, label: "e.g. ******", hint: "Enter you password", cap: TextCapitalization.none),
              // SizedBox(height: 10, ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                  child: RoundedButton(
                      text: "Login",
                      press: () async{
                        //let's test the app
                        User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                        print(user);
                        if(user != null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      }
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
