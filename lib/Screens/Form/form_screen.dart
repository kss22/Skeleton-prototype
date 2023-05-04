import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Form/components/form_body.dart';


class AddMedicationsScreen extends StatefulWidget {
  const AddMedicationsScreen({Key? key}) : super(key: key);

  @override
  _AddMedicationsScreenState createState() => _AddMedicationsScreenState();

}

class _AddMedicationsScreenState extends State<AddMedicationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddMedicationsBody(),
    );
  }
}
