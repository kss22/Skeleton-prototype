import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen_individual.dart';
import 'package:skeleton_prototype/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  late List<Map<dynamic, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() {
    final DatabaseReference database = FirebaseDatabase.instance.reference().child('doctors');
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


// Container(
    //   padding: EdgeInsets.only(left: 7.0, top: 3.0),
    //   child: ListView(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Row(
    //           children: [
    //             DecoratedBox(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20.0),
    //                 color: kPrimaryLightColor,
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 30.0,
    //                       //TODO add profile picture
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: Text(
    //                         //TODO add users
    //                         "Add Username of linked accounts",
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w400, fontSize: 20.0),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
