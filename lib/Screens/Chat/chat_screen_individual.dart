import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Entity/components/background.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: false,
            title: FlatButton(
              onPressed: (){},
              child: Container(
                width: 300.0,
                height: 50.0,
                alignment: Alignment.center,
                child: Text(
                  "Username_0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: Text("hahahahahha")
    );
  }
}
