import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login/login_screen.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';


class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome: ${_currentUser.displayName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: ${_currentUser.email}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 24.0,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 16.0),
            _currentUser.emailVerified
                ? Text(
              'Email verified',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
              ),
            )
                : Text(
              'Email not verified',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20,),
            RoundedButton(
              press: () async {
                await _currentUser.sendEmailVerification();
              },
              text: 'Verify email',
            ),
            SizedBox(height: 10,),
            RoundedButton(
              color: kPrimaryLightColor,
              textColor: kPrimaryColor,
              text: 'Login',
              press: () async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
            ),
            SizedBox(height: 6.0,),
            DecoratedBox(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.refresh),
                color: kPrimaryLightColor,
                onPressed: () async {
                  User? user = await refreshUser(_currentUser);
                  if (user != null) {
                    setState(() {
                      _currentUser = user;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}