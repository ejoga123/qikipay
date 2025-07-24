import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();
  final _accountNumberController = TextEditingController();
  String? _selectedBank;

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_formKey.currentState!.validate()) {
      final recipient = _recipientController.text.trim();
      final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
      final accountNumber = _accountNumberController.text.trim();
      final bankName = _selectedBank ?? '';

      // TODO: Add transaction logic here
      print(
          'Sending ₦$amount to $recipient, Account: $accountNumber, Bank: $bankName');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '₦$amount sent to $recipient, Account: $accountNumber, Bank: $bankName')),
      );
    }
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
            const Text('Send Money'),
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
                controller: _recipientController,
                decoration: const InputDecoration(labelText: 'Recipient ID'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter recipient ID'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _accountNumberController,
                decoration: const InputDecoration(labelText: 'Account Number'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter account number'
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select Bank'),
                value: _selectedBank,
                items: <String>[
                  'Access Bank Plc',
                  'FBN Holdings Plc',
                  'Guaranty Trust Bank Plc',
                  'United Bank for Africa Plc',
                  'Zenith Bank Plc',
                  'First City Monument Bank Plc',
                  'Stanbic IBTC Bank Plc',
                  'Union Bank of Nigeria Plc',
                  'Wema Bank Plc',
                  'Sterling Bank Plc',
                  'Ecobank Nigeria Ltd',
                  'Polaris Bank Ltd',
                  'Heritage Bank Plc',
                  'Jaiz Bank Plc',
                  'Keystone Bank Ltd',
                  'Providus Bank Ltd',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBank = newValue;
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Select a bank' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount (₦)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter amount' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _handleSend,
                icon: const Icon(Icons.send),
                label: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
