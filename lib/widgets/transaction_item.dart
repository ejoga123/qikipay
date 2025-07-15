import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final String currency;
  final String label;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.currency,
    this.label = 'Available Balance',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo.shade600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(currency,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(width: 6),
              Text(balance.toStringAsFixed(2),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
