import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String userName = "";
  final List<String> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set up a listener for changes in the "messages" node
    FirebaseDatabase.instance.reference().child('messages').onChildAdded.listen((event) {
      // Extract the message data and add it to the list of messages
      Map<String, dynamic> messageData = Map<String, dynamic>.from(event.snapshot.value);
      String messageText = messageData["text"];
      String username = messageData["name"];
      int timestamp = messageData["timestamp"];
      setState(() {
        _messages.insert(0, "$username: $messageText ($timestamp)");
      });
    });
  }

  Widget _buildTextComposer() {
    User? user = FirebaseAuth.instance.currentUser;

    String uid = user?.uid ?? "";

    final DatabaseReference database = FirebaseDatabase.instance.reference();

    // TODO must be fixed to get the signed in user
    database.child('users').child(uid).once().then((DataSnapshot snapshot) {
      // Handle the retrieved data
      setState(() {
        userName = snapshot.value['name'];
      });
    }).catchError((error) {
      // Handle any errors that occur while retrieving data
      print('Failed to retrieve data: $error');
    });

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textEditingController.text),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    // Construct a new message with the user's name and text
    String username = userName; // Replace with the user's actual name
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> messageData = {
      "text": text,
      "name": username,
      "timestamp": timestamp
    };
    // Add the message to the "messages" node in the database
    FirebaseDatabase.instance.reference().child('messages').push().set(messageData);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                String message = _messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Divider(),
          _buildTextComposer(),
        ],
      ),
    );
  }
}






// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final List<Map<String, dynamic>> _messages = [];
//
//   final TextEditingController _textEditingController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Set up a listener for changes in the "messages" node
//     FirebaseDatabase.instance.reference().child('messages').onChildAdded.listen((event) {
//       // Extract the message data and add it to the list of messages
//       Map<String, dynamic> messageData = Map<String, dynamic>.from(event.snapshot.value);
//       setState(() {
//         _messages.insert(0, messageData);
//       });
//     });
//   }
//
//   Widget _buildTextComposer() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Flexible(
//             child: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration.collapsed(hintText: "Send a message"),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () => _handleSubmitted(_textEditingController.text),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     // Construct a new message with the user's name and text
//     String username = "John Doe"; // Replace with the user's actual name
//     Map<String, dynamic> messageData = {
//       "text": text,
//       "name": username,
//       "timestamp": DateTime.now().millisecondsSinceEpoch
//     };
//     // Add the message to the "messages" node in the database
//     FirebaseDatabase.instance.reference().child('messages').push().set(messageData);
//     _textEditingController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat Screen"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Map<String, dynamic> messageData = _messages[index];
//                 return ListTile(
//                   title: Text(messageData["text"]),
//                   subtitle: Text(messageData["name"]),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }
// }






// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final List<String> _messages = [];
//   late DatabaseReference _messagesRef;
//   late Stream<Event> _messagesStream;
//
//   final TextEditingController _textEditingController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _messagesRef = FirebaseDatabase.instance.reference().child('messages');
//     _messagesStream = _messagesRef.onChildAdded;
//     _messagesStream.listen(_onMessageAdded);
//   }
//
//   void _onMessageAdded(Event event) {
//     // Extract the message text from the DataSnapshot
//     DataSnapshot snapshot = event.snapshot;
//     String messageText = snapshot.value['text'];
//     setState(() {
//       _messages.insert(0, messageText);
//     });
//   }
//
//   Widget _buildTextComposer() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Flexible(
//             child: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration.collapsed(hintText: "Send a message"),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () => _handleSubmitted(_textEditingController.text),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     // Generate a new child node with a unique key and set the message text
//     _messagesRef.push().set({'text': text});
//     _textEditingController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat Screen"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }
// }



// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:skeleton_prototype/Screens/Entity/components/background.dart';
//
// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final List<String> _messages = [];
//
//   final TextEditingController _textEditingController = TextEditingController();
//
//   void _addMessage(String message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//     _textEditingController.clear();
//   }
//
//   Widget _buildTextComposer() {
//
//     FirebaseDatabase.instance.reference().child('messages').once().then((DataSnapshot snapshot) {
//       // Iterate through the child nodes of the "messages" node
//       Map<dynamic, dynamic> values = snapshot.value;
//       values.forEach((key, value) {
//         // Extract the message text and display it
//         String messageText = value['text'];
//         print('Message: $messageText');
//       });
//     });
//
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Flexible(
//             child: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration.collapsed(hintText: "Send a message"),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () => _handleSubmitted(_textEditingController.text),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     _addMessage(text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat Screen"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }
// }