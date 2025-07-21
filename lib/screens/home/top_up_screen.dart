import 'package:flutter/material.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String selectedMethod = 'Card';

  void _handleTopUp() {
    if (_formKey.currentState!.validate()) {
      final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
      // TODO: Add top-up logic here
      print('Top-up ₦$amount via $selectedMethod');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('₦$amount top-up via $selectedMethod')),
      );
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text('Top Up Wallet'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount (₦)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter amount' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedMethod,
                items: const [
                  DropdownMenuItem(value: 'Card', child: Text('Card')),
                  DropdownMenuItem(value: 'Bank', child: Text('Bank Transfer')),
                  DropdownMenuItem(value: 'USSD', child: Text('USSD')),
                ],
                onChanged: (value) => setState(() => selectedMethod = value!),
                decoration: const InputDecoration(labelText: 'Payment Method'),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _handleTopUp,
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text('Top Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
