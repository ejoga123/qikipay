import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ExpansionTile(
            title: const Text('How do I top up my wallet?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Go to the Top Up screen, enter the amount, select a payment method, and confirm.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('How do I send money to another user?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Use the Send Money screen, enter the recipient ID and amount, then tap Send.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('How do I reset my password?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Go to the Login screen and tap "Forgot Password" to receive reset instructions.',
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('support@qikipay.com'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('+234 800 123 4567'),
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Live Chat'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Live Chat'),
                  content: const Text('Live chat feature coming soon!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
