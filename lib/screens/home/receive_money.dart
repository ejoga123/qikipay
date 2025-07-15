import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});

  final String userWalletId = 'user123-wallet'; // Replace with actual wallet ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receive Money')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Your Wallet ID',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(
              userWalletId,
              style: const TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            const SizedBox(height: 24),
            QrImageView(
              data: userWalletId,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Add copy-to-clipboard logic
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy Wallet ID'),
            ),
          ],
        ),
      ),
    );
  }
}
