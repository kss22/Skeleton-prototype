class MedicineList {
  String medication;
  String dosage;
  String price;

  MedicineList(
      {
        required this.medication,
        required this.dosage,
        required this.price,
        });

  Map<String, dynamic> toMap() {
    return {
      'medication': medication,
      'dosage': dosage,
      'price': price,
    };
  }
}
