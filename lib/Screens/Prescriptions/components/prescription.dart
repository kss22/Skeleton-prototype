class Prescription {
  String patientName;
  String medication;
  String frequency;
  String dosage;
  String doctorName;
  String state;

  Prescription(
      {required this.patientName,
      required this.medication,
      required this.dosage,
      required this.frequency,
      required this.doctorName,
      required this.state});

  Map<String, dynamic> toMap() {
    return {
      'patientName': patientName,
      'medication': medication,
      'dosage': dosage,
      'frequency': frequency,
      'doctor': doctorName,
      'state': state
    };
  }
}
