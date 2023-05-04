import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/UserProfile/components/user_profile_body.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return UserProfilePage();
  }
}
