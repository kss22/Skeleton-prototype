import 'package:flutter/material.dart';

import 'components/pharmacist_home_body.dart';

class PharmacistHomeScreen extends StatefulWidget {
  const PharmacistHomeScreen({Key? key}) : super(key: key);

  @override
  _PharmacistHomeScreenState createState() => _PharmacistHomeScreenState();

}

class _PharmacistHomeScreenState extends State<PharmacistHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PharmacistHomeBody(),
    );
  }
}
