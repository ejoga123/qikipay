import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../models/wallet_model.dart';
import '../../models/transaction_model.dart';
import '../../services/auth_service.dart';
import '../../services/wallet_service.dart';
import '../../services/transaction_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();
  final WalletService _walletService = WalletService();
  final TransactionService _transactionService = TransactionService();

  WalletModel? _wallet;
  List<TransactionModel> _transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    final currentUser = _authService
        .currentUser; // Use getter instead of accessing _auth directly
    if (currentUser != null) {
      final wallet = await _walletService.getUserWallet(currentUser.uid);
      final txns =
          await _transactionService.getUserTransactions(currentUser.uid);
      setState(() {
        _wallet = wallet;
        _transactions = txns;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title:
            const Text("QikiPay Wallet", style: TextStyle(color: Colors.white)),
        centerTitle: true,
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Current Balance",
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Text(
                    "₦${_wallet?.balance.toStringAsFixed(2) ?? '0.00'}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: AppFontSizes.title,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _transactions.isEmpty
                  ? const Center(child: Text("No transactions yet."))
                  : ListView.builder(
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        final tx = _transactions[index];
                        return ListTile(
                          leading: Icon(
                            tx.isDebit
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: tx.isDebit ? Colors.red : Colors.green,
                          ),
                          title: Text(tx.title),
                          subtitle: Text(
                            tx.timestamp.toLocal().toString().split('.').first,
                          ),
                          trailing: Text(
                            "${tx.isDebit ? '-' : '+'}₦${tx.amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: tx.isDebit ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
