import 'package:flutter/material.dart';

class BuyDataScreen extends StatefulWidget {
  const BuyDataScreen({super.key});

  @override
  State<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends State<BuyDataScreen> {
  final Map<String, bool> _dataPlans = {
    '500MB Data Plan': false,
    '1GB Data Plan': false,
    '2GB Data Plan': false,
    '5GB Data Plan': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Data Plan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Select data plan(s) to buy:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._dataPlans.keys.map((plan) {
            return CheckboxListTile(
              title: Text(plan),
              value: _dataPlans[plan],
              onChanged: (bool? value) {
                setState(() {
                  _dataPlans[plan] = value ?? false;
                });
              },
            );
          }).toList(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final selectedPlans = _dataPlans.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Selected Data Plans'),
                  content: Text(selectedPlans.isNotEmpty
                      ? selectedPlans.join(', ')
                      : 'No data plans selected'),
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
