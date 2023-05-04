import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/components/patients_list.dart';
import 'package:skeleton_prototype/Screens/List/components/pharmacies_list.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    return PatientsList();
  }
}
