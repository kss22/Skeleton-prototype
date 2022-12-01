import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Pharmacy/components/pharmacy_body.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  @override
  Widget build(BuildContext context) {
    return PharmacyBody();
  }
}
