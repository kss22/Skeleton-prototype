import 'package:flutter/material.dart';
import 'package:skeleton_prototype/constants.dart';

class Fieldtext extends StatelessWidget {
  final bool visibility;
  final String label;
  final String hint;
  final TextCapitalization cap;

  const Fieldtext({
    Key? key,
    required this.visibility,
    required this.label,
    required this.hint,
    required this.cap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5.0),
      child: TextField(
        autofocus: false,
        textCapitalization: cap,
        obscureText: !visibility,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryLightColor,
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}