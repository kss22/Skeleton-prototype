import 'package:http/http.dart';
import 'dart:convert';
//TODO implement database
class User{

  late String username;
  late String password;
  late String profilePicture;
  late num id;
  late bool isMale;

  User({required this.username, required this.password, required this.isMale});

  Future<void> getUser() async{
    try {
      Response response = await get(
          Uri.https('url...', '../dir/$id'));
      Map data = jsonDecode(response.body);


      username = data['username'];
      password  = data['password'];

    }
    catch(e){
      print('caught an error: $e');
      username = 'could not get time data';
    }
  }
}