import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/PharmacistProfile/medicine.dart';

class AddStockPage extends StatefulWidget {

  const AddStockPage(
      {Key? key,
      required this.pharmacyUid})
      : super(key: key);

  final String pharmacyUid;

  @override
  _AddStockPageState createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  final _medicineController = TextEditingController();
  final _doseController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final databaseReference = FirebaseDatabase.instance.reference();

    void _addMedicine() {
      Medicine _medicine = Medicine(
          quantity: _quantityController.text,
          medication: _medicineController.text,
          dosage: _doseController.text,
          price: _priceController.text,
          state: 'available');
      DatabaseReference prescriptionsRef = databaseReference
          .child('pharmacies')
          .child(widget.pharmacyUid)
          .child('meds');
      prescriptionsRef.push().set(_medicine.toMap());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Medicine"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quantity",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Price",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Medication",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _medicineController,
                decoration: InputDecoration(
                  labelText: 'Medicine Name',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Dosage",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _doseController,
                decoration: InputDecoration(
                  labelText: 'Dosage',
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addMedicine();
                    Navigator.pop(context);
                  },
                  child: Text("Add to stock"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
