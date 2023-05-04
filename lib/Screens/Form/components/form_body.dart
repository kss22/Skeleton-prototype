import 'package:flutter/material.dart';

class AddMedicationsBody extends StatefulWidget {
  const AddMedicationsBody({Key? key}) : super(key: key);

  @override
  _AddMedicationsBodyState createState() => _AddMedicationsBodyState();
}

class _AddMedicationsBodyState extends State<AddMedicationsBody> {
  final _formKey = GlobalKey<FormState>();
  final _medicationNameController = TextEditingController();
  final _stockQuantityController = TextEditingController();
  final _dosageController = TextEditingController();
  List<Map<String, dynamic>> _medications = [];

  @override
  void dispose() {
    _medicationNameController.dispose();
    _stockQuantityController.dispose();
    _dosageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _medicationNameController,
                decoration: InputDecoration(
                  labelText: 'Medication Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a medication name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _stockQuantityController,
                decoration: InputDecoration(
                  labelText: 'Stock Quantity',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a stock quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dosageController,
                decoration: InputDecoration(
                  labelText: 'Dosage',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a dosage';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final medicationName = _medicationNameController.text;
                    final dosage = int.parse(_dosageController.text);
                    final stockQuantity = int.parse(_stockQuantityController.text);
                    final medication = {
                      'name': medicationName,
                      'quantity': stockQuantity,
                      'dosage': dosage,
                    };
                    setState(() {
                      _medications.add(medication);
                      _medicationNameController.clear();
                      _stockQuantityController.clear();
                      _dosageController.clear();
                    });
                  }
                },
                child: Text('Add Medication'),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _medications.length,
                  itemBuilder: (context, index) {
                    final medication = _medications[index];
                    return ListTile(
                      title: Text(medication['name']),
                      subtitle: Text('Stock: ${medication['quantity']}, Dosage: ${medication['dosage']} mg'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}