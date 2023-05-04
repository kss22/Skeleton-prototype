import 'package:flutter/material.dart';

class MedicationsSalesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sales;

  MedicationsSalesScreen({Key? key, required this.sales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications Sales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Sales: ${calculateTotalSales()} L.L',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  final medicationSale = sales[index];
                  return ListTile(
                    title: Text(medicationSale['name']),
                    subtitle: Text('Sold: ${medicationSale['quantity']}'),
                    trailing: Text(
                      '${medicationSale['quantity'] * medicationSale['price']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  num calculateTotalSales() {
      num totalSales = sales.fold(0, (sum, sale) => sum + sale['price'] * sale['quantity']);
    return totalSales;
  }
}