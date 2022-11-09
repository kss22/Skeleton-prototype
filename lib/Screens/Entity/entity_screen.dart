import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Entity/components/body.dart';
import 'package:skeleton_prototype/constants.dart';

class EntityScreen extends StatefulWidget {
  const EntityScreen({Key? key}) : super(key: key);

  @override
  _EntityScreenState createState() => _EntityScreenState();
}

class _EntityScreenState extends State<EntityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        backgroundColor: kPrimaryColor,
      ),
      body: BodyEntity(),
    );
  }
}
