import 'package:flutter/material.dart';
import 'components/prescription_body.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key, required this.name, required this.uid, required this.doctor}) : super(key: key);

  final uid;
  final name;
  final doctor;

  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();

}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrescriptionPage(patientName: widget.name, patientUid: widget.uid, doctorName: widget.doctor,),
    );
  }
}
