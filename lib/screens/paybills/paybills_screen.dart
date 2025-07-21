import 'package:flutter/material.dart';

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is the Pay Bills Screen'),
      ),
    );
  }
}
