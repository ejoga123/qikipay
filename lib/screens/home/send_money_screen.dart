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

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_formKey.currentState!.validate()) {
      final recipient = _recipientController.text.trim();
      final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;

      // TODO: Add transaction logic here
      print('Sending ₦$amount to $recipient');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('₦$amount sent to $recipient')),
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
