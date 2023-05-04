import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login_doctor/components/login_doctor_body.dart';
import 'package:skeleton_prototype/constants.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginDoctor extends StatefulWidget {
  const LoginDoctor({Key? key}) : super(key: key);

  @override
  _LoginDoctorState createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {

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
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
