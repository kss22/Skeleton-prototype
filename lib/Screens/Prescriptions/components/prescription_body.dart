import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/components/prescription.dart';

class PrescriptionPage extends StatefulWidget {
  final String? medicineName;
  final String? patientName;
  final String? doctorName;

  const PrescriptionPage(
      {Key? key,
      this.medicineName,
      this.patientName,
      this.doctorName,
      required this.patientUid})
      : super(key: key);

  final String patientUid;

  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  final _medicineController = TextEditingController();
  final _patientController = TextEditingController();
  final _doctorController = TextEditingController();
  final _doseController = TextEditingController();
  final _frequencyController = TextEditingController();

  void initState() {
    super.initState();
    if (widget.medicineName != null) {
      _medicineController.text = widget.medicineName!;
    }
    if (widget.patientName != null) {
      _patientController.text = widget.patientName!;
    }
    if (widget.doctorName != null) {
      _doctorController.text = widget.doctorName!;
    }
  }

  @override
  void dispose() {
    _medicineController.dispose();
    _patientController.dispose();
    _doctorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final databaseReference = FirebaseDatabase.instance.reference();

    void _savePrescription() {
      Prescription _prescription = Prescription(
          patientName: _patientController.text,
          medication: _medicineController.text,
          dosage: _doseController.text,
          frequency: _frequencyController.text,
          doctorName: _doctorController.text,
          state: 'pending');
      DatabaseReference prescriptionsRef = databaseReference
          .child('users')
          .child(widget.patientUid)
          .child('prescriptions');
      prescriptionsRef.push().set(_prescription.toMap());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient Name",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _patientController,
                decoration: InputDecoration(
                  labelText: 'Patient Name',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Doctor Name",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _doctorController,
                decoration: InputDecoration(
                  labelText: 'Doctor Name',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Medication",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _medicineController,
                decoration: InputDecoration(
                  labelText: 'Medicine Name',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Dosage",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _doseController,
                decoration: InputDecoration(
                  labelText: 'Dosage',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Frequency",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _frequencyController,
                decoration: InputDecoration(
                  labelText: 'Frequency',
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _savePrescription();
                    Navigator.pop(context);
                  },
                  child: Text("Save Prescription"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
