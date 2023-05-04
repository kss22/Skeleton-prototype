import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorSignup/doctor_signup.dart';
import 'package:skeleton_prototype/Screens/PharmacySignup/pharmacy_signup.dart';
import 'package:skeleton_prototype/Screens/Signup/components/user_body.dart';
import 'package:skeleton_prototype/constants.dart';


class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  _PharmacyScreenState createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return PharmacyBodySignup();
          }
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
