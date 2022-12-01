import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Alternative/components/alternative_body.dart';

class Alternative extends StatefulWidget {
  const Alternative({Key? key}) : super(key: key);

  @override
  _AlternativeState createState() => _AlternativeState();
}

class _AlternativeState extends State<Alternative> {
  @override
  Widget build(BuildContext context) {
    return AlternativeBody();
  }
}
