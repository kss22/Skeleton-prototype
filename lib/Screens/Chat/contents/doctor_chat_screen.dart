import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Chat/contents/chat_body.dart';
import 'package:skeleton_prototype/Screens/Chat/contents/doctor_chat.dart';


class DoctorChat extends StatefulWidget {
  const DoctorChat({Key? key}) : super(key: key);

  @override
  _DoctorChatState createState() => _DoctorChatState();
}

class _DoctorChatState extends State<DoctorChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: DoctorChatBody(),
    );
  }
}
