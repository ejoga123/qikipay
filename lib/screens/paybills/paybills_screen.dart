import 'package:flutter/material.dart';

class PayBillsScreen extends StatefulWidget {
  const PayBillsScreen({super.key});

  @override
  State<PayBillsScreen> createState() => _PayBillsScreenState();
}

class _PayBillsScreenState extends State<PayBillsScreen> {
  final Map<String, bool> _billCategories = {
    'Electricity': false,
    'Waste Bill': false,
    'Product and Services': false,
    'School & Exam': false,
    'Internet Service': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Select bills to pay:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._billCategories.keys.map((category) {
            return CheckboxListTile(
              title: Text(category),
              value: _billCategories[category],
              onChanged: (bool? value) {
                setState(() {
                  _billCategories[category] = value ?? false;
                });
              },
            );
          }).toList(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final selectedBills = _billCategories.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              // For now, just show selected bills in a dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Selected Bills'),
                  content: Text(selectedBills.isNotEmpty
                      ? selectedBills.join(', ')
                      : 'No bills selected'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Confirm Selection'),
          ),
        ],
      ),
    );
  }
}
