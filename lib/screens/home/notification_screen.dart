import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
            const Text('Notifications'),
          ],
        ),
      ),
      body: const Center(
        child: Text('Notifications feature is not implemented yet.'),
      ),
    );
  }
}
