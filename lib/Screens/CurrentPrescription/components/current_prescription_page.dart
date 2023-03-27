import 'package:flutter/material.dart';

class CurrentPrescriptionPage extends StatelessWidget {
  final String doctorName;
  final String patientName;
  final String medicineName;
  final String dosage;
  final String duration;

  const CurrentPrescriptionPage({
    Key? key,
    required this.doctorName,
    required this.patientName,
    required this.medicineName,
    required this.dosage,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Done'),
              onPressed: () {},
            ),
            Text('Doctor Name: $doctorName', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Patient Name: $patientName', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Medicine Name: $medicineName',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Dosage: $dosage', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Duration: $duration', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
