import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/components/patient_body.dart';


class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return PatientBody();
  }
}
