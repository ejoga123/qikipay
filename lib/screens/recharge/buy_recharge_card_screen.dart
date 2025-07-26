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

  final List<String> _networkProviders = ['Airtel', 'MTN', 'Glo', '9mobil'];
  String? _selectedProvider;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
            'Select network provider:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _selectedProvider,
            hint: const Text('Choose a network provider'),
            isExpanded: true,
            items: _networkProviders.map((provider) {
              return DropdownMenuItem<String>(
                value: provider,
                child: Text(provider),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedProvider = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Enter phone number to credit:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter phone number',
            ),
          ),
          const SizedBox(height: 20),
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
              if (_selectedProvider == null || _phoneController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Missing Information'),
                    content: const Text(
                        'Please select a network provider and enter a phone number.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return;
              }
              final selectedOptions = _rechargeOptions.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Selected Recharge Cards'),
                  content: Text(selectedOptions.isNotEmpty
                      ? "Provider: $_selectedProvider\nPhone: ${_phoneController.text}\nCards: ${selectedOptions.join(', ')}"
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
