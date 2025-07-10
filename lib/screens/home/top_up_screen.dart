import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../widgets/custom_button.dart';
import '../../services/auth_service.dart';
import '../../services/wallet_service.dart';
import '../../services/transaction_service.dart';
import '../../models/transaction_model.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final _amountController = TextEditingController();

  final _authService = AuthService();
  final _walletService = WalletService();
  final _transactionService = TransactionService();

  bool _isLoading = false;

  Future<void> _topUpWallet() async {
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid amount")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final user = _authService._auth.currentUser;
    if (user == null) return;

    final wallet = await _walletService.getUserWallet(user.uid);
    final newBalance = (wallet?.balance ?? 0) + amount;

    await _walletService.updateBalance(user.uid, newBalance);

    final transaction = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: "Wallet Top-up",
      amount: amount,
      isDebit: false,
      timestamp: DateTime.now(),
    );

    await _transactionService.addTransaction(user.uid, transaction);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Wallet funded successfully!")),
    );

    Navigator.pop(context);
    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fund Wallet")),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text("Amount to Add",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "₦0.00"),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "Fund Now",
              onPressed: _topUpWallet,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
