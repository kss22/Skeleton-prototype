import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen_individual.dart';
import 'package:skeleton_prototype/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class DoctorChatBody extends StatefulWidget {
  const DoctorChatBody({Key? key}) : super(key: key);

  @override
  _DoctorChatBodyState createState() => _DoctorChatBodyState();
}

class _DoctorChatBodyState extends State<DoctorChatBody> {
  late List<Map<dynamic, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child('users');
    database.once().then((DataSnapshot snapshot) {
      List<Map<dynamic, dynamic>> tempList = [];
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        tempList.add(value);
      });
      setState(() {
        userList = tempList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29.0)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 25.0,
                            child: Image.asset("assets/icons/img_3.png"),
                          ),
                        ),
                        Text(userList[index]['name'], style: TextStyle(fontSize: 24.0)),
                      ],
                    )),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
              },
            );
          },
          itemCount: userList.length),
    );
  }
}

