import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Chat/contents/chat_body.dart';


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: ChatBody(),
    );
  }
}
