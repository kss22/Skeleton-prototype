import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> _notifications = [    "You have a new message",    "Your medicine is available",    "An alternative is found nearby",    "Prescription incomplete",    "Your account password was changed",  ];

  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(_notifications[index]),
            subtitle: Text("Today, 10:30 AM"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, "/chat_page");
            },
          );
        },
      ),
    );
  }
}