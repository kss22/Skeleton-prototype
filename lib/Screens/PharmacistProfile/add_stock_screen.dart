import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/PharmacistProfile/add_stock.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _AddStockScreenState createState() => _AddStockScreenState();

}

class _AddStockScreenState extends State<AddStockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddStockPage(pharmacyUid: widget.uid,),
    );
  }
}
