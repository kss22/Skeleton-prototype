class Users {
  String email;
  String name;
  String phone;
  String city;
  String country;
  String meds;
  String birth;
  String password;
  String uid;
  List prescriptions;

  Users({
    required this.email,
    required this.name,
    required this.phone,
    required this.city,
    required this.country,
    required this.meds,
    required this.birth,
    required this.password,
    required this.uid,
    required this.prescriptions,
  });

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'city': city,
      'country': country,
      'meds': meds,
      'birth': birth,
      'pass': password,
      'uid' : uid,
      'prescriptions': prescriptions,
    };
  }
}