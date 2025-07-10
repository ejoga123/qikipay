import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../widgets/custom_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title:
            const Text("QikiPay Wallet", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Current Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 6),
                  Text("₦25,750.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text("Quick Actions",
                style: TextStyle(
                    fontSize: AppFontSizes.title, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionTile(icon: Icons.send, label: "Send"),
                _ActionTile(icon: Icons.account_balance_wallet, label: "Fund"),
                _ActionTile(icon: Icons.history, label: "History"),
              ],
            ),
            const SizedBox(height: 32),
            const Text("Recent Transactions",
                style: TextStyle(
                    fontSize: AppFontSizes.title, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _TransactionTile(
                    label: "Sent to Michael",
                    amount: "-₦5,000",
                    isDebit: true,
                  ),
                  _TransactionTile(
                    label: "Wallet Top-up",
                    amount: "+₦10,000",
                    isDebit: false,
                  ),
                  _TransactionTile(
                    label: "Electricity Bill",
                    amount: "-₦2,150",
                    isDebit: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.accent,
          radius: 28,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String label;
  final String amount;
  final bool isDebit;

  const _TransactionTile(
      {required this.label, required this.amount, required this.isDebit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isDebit ? Icons.arrow_upward : Icons.arrow_downward,
        color: isDebit ? Colors.red : Colors.green,
      ),
      title: Text(label),
      trailing: Text(amount,
          style: TextStyle(
              color: isDebit ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold)),
    );
  }
}
