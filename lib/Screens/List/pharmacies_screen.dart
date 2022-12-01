import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/List/components/pharmacies_list.dart';

class Pharmacies extends StatefulWidget {
  const Pharmacies({Key? key}) : super(key: key);

  @override
  _PharmaciesState createState() => _PharmaciesState();
}

class _PharmaciesState extends State<Pharmacies> {
  @override
  Widget build(BuildContext context) {
    return PharmaciesList();
  }
}
