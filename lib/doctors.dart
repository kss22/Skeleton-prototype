class Doctors {
  String email;
  String name;
  String phone;
  String city;
  String country;
  String birth;
  String password;
  String uid;
  String syndicateNum;

  Doctors({
    required this.email,
    required this.name,
    required this.phone,
    required this.city,
    required this.country,
    required this.birth,
    required this.password,
    required this.uid,
    required this.syndicateNum
  });

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'city': city,
      'country': country,
      'birth': birth,
      'pass': password,
      'uid' : uid,
      'syndicate_number': syndicateNum,

    };
  }
}