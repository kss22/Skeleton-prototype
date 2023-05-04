import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/PendingPrescriptions/pending_prescriptions.dart';
import 'package:skeleton_prototype/Screens/Prescriptions%20History/prescriptions_history.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String userEmail = "";
  String userName = "";
  String birth = "";
  String phone = "";
  String city = "";
  String country = "";
  String medicalConditions = "";

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String uid = user?.uid ?? "";

    final DatabaseReference database = FirebaseDatabase.instance.reference();

    // TODO must be fixed to get the signed in user
    database.child('users').child(uid).once().then((DataSnapshot snapshot) {
      // Handle the retrieved data
      setState(() {
        userEmail = snapshot.value['email'];
        userName = snapshot.value['name'];
        birth = snapshot.value['birth'];
        city = snapshot.value['city'];
        country = snapshot.value['country'];
        phone = snapshot.value['phone'];
        medicalConditions = snapshot.value['meds'];
      });
    }).catchError((error) {
      // Handle any errors that occur while retrieving data
      print('Failed to retrieve data: $error');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Add code to navigate to the edit profile page
            },
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) {
                  if (route.settings.name=='/'){
                    return true;
                  }else{
                    return false;
                  }
                });
              },
              icon: Icon(Icons.login))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      UserInfoRow(title: 'Email', value: userEmail),
                      UserInfoRow(title: 'Name', value: userName),
                      UserInfoRow(title: 'Phone Number', value: phone),
                      UserInfoRow(title: 'City', value: city),
                      UserInfoRow(title: 'Country', value: country),
                      UserInfoRow(title: 'Medical conditions', value: medicalConditions),
                      UserInfoRow(title: 'Date of Birth', value: birth),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            RoundedButton(
              text: 'Current prescriptions',
              press: () {
                // Add code to navigate to the edit profile page
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PendingPrescriptionsList()));
              },
            ),
            RoundedButton(
              text: 'Prescription history',
              press: () {
                // Add code to navigate to the edit profile page
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HistoryPrescriptionsList()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String title;
  final String value;

  UserInfoRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}