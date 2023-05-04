class Pharmacys {
  String email;
  String name;
  String phone;
  String city;
  String country;
  List medicines;
  String birth;
  String uid;
  String syndicateNum;
  List loyalCustomers;

  Pharmacys({
    required this.email,
    required this.name,
    required this.phone,
    required this.city,
    required this.country,
    required this.medicines,
    required this.birth,
    required this.uid,
    required this.syndicateNum,
    required this.loyalCustomers,
  });

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'city': city,
      'country': country,
      'meds': medicines,
      'birth': birth,
      'uid' : uid,
      'syndicate_number': syndicateNum,
      'loyal_customers': loyalCustomers,
    };
  }
}