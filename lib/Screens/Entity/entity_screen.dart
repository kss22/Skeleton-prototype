import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Entity/components/body.dart';

class EntityScreen extends StatefulWidget {
  const EntityScreen({Key? key}) : super(key: key);

  @override
  _EntityScreenState createState() => _EntityScreenState();
}

class _EntityScreenState extends State<EntityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
