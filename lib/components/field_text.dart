import 'package:flutter/material.dart';

class Fieldtext extends StatelessWidget {
  final bool visibility;
  final String label;
  final String hint;

  const Fieldtext({
    Key? key,
    required this.visibility,
    required this.label,
    required this.hint,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5.0),
      child: TextField(
        obscureText: !visibility,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}