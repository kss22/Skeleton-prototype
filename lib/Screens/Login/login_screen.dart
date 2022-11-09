import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login/components/login_body.dart';
import 'package:skeleton_prototype/constants.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Initialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return BodyLogIn();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
