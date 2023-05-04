class Medicine {
  String medication;
  String dosage;
  String state;
  String quantity;
  String price;

  Medicine(
      {required this.quantity,
        required this.medication,
        required this.dosage,
        required this.price,
        required this.state});

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'medication': medication,
      'dosage': dosage,
      'price': price,
      'state': state
    };
  }
}
