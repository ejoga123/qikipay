import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../widgets/custom_button.dart';
import '../../services/auth_service.dart';
import '../../services/wallet_service.dart';
import '../../services/transaction_service.dart';
import '../../models/transaction_model.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();

  final _authService = AuthService();
  final _walletService = WalletService();
  final _transactionService = TransactionService();

  bool _isLoading = false;

  Future<void> _sendMoney() async {
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    if (_recipientController.text.trim().isEmpty || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid details")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final user = _authService._auth.currentUser;
    if (user == null) return;

    final wallet = await _walletService.getUserWallet(user.uid);
    if (wallet != null && wallet.balance >= amount) {
      final newBalance = wallet.balance - amount;

      await _walletService.updateBalance(user.uid, newBalance);

      final transaction = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: "Sent to ${_recipientController.text.trim()}",
        amount: amount,
        isDebit: true,
        timestamp: DateTime.now(),
      );

      await _transactionService.addTransaction(user.uid, transaction);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Money sent successfully!")),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Insufficient balance")),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send Money")),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text("Recipient",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name or ID"),
            ),
            const SizedBox(height: 16),
            const Text("Amount", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "₦0.00"),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "Send",
              onPressed: _sendMoney,
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }
}
