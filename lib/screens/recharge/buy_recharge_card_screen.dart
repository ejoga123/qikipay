import 'package:flutter/material.dart';

class BuyRechargeCardScreen extends StatefulWidget {
  const BuyRechargeCardScreen({super.key});

  @override
  State<BuyRechargeCardScreen> createState() => _BuyRechargeCardScreenState();
}

class _BuyRechargeCardScreenState extends State<BuyRechargeCardScreen> {
  final Map<String, bool> _rechargeOptions = {
    '₦500 Recharge Card': false,
    '₦1000 Recharge Card': false,
    '₦2000 Recharge Card': false,
    '₦5000 Recharge Card': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Recharge Card'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Select recharge card(s) to buy:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._rechargeOptions.keys.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: _rechargeOptions[option],
              onChanged: (bool? value) {
                setState(() {
                  _rechargeOptions[option] = value ?? false;
                });
              },
            );
          }).toList(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final selectedOptions = _rechargeOptions.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Selected Recharge Cards'),
                  content: Text(selectedOptions.isNotEmpty
                      ? selectedOptions.join(', ')
                      : 'No recharge cards selected'),
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
