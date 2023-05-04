import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen_individual.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/doctor_home_screen.dart';
import 'package:skeleton_prototype/Screens/Entity/entity_screen.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/Login/login_screen.dart';
import 'package:skeleton_prototype/Screens/Login_entity/login_entity_screen.dart';
import 'package:skeleton_prototype/Screens/Signup/user_signup_screen.dart';
import 'package:skeleton_prototype/Screens/Welcome/welcome_screen.dart';
import 'Screens/DoctorHome/components/patient_screen.dart';
import 'Screens/DoctorHome/components/patients_screen.dart';
import 'Screens/Login_doctor/login_doctor_screen.dart';
import 'Screens/Login_pharmacist/login_pharmacist_screen.dart';
import 'Screens/Notification/notification_screen.dart';
import 'Screens/PharmacistHome/components/patients_list_pharmacy.dart';
import 'Screens/PharmacistHome/pharmacist_home_screen.dart';
import 'Screens/Prescriptions/prescription_screen.dart';
import 'Screens/UserProfile/user_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/entity': (context) => EntityScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        // '/home': (context) => HomeScreen(),
        '/chat': (context) => Chat(),
        '/login_entity': (context) => LoginEntityScreen(),
        '/login_pharmacist': (context) => LoginPharmacist(),
        '/login_doctor': (context) => LoginDoctor(),
        '/doctor_home': (context) => DoctorHomeScreen(),
        '/pharmacist_home': (context) => PharmacistHomeScreen(),
        '/patients': (context) => Patients(),
        '/patient': (context) => Patient(),
        '/chat_page': (context) => ChatPage(),
        '/notification': (context) => NotificationScreen(),
        '/userProfile': (context) => UserProfileScreen(),
        '/pharmacy_patient_list': (context) => PharmacyPatientsList(),
        // '/camera': (context) => CameraBody(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // routes: {
//       //   '/': (context) => WelcomeScreen(),
//       //   '/entity': (context) => EntityScreen(),
//       // },
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }
