import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../models/wallet_model.dart';
import '../../models/transaction_model.dart';
import '../../services/auth_service.dart';
import '../../services/wallet_service.dart';
import '../../services/transaction_service.dart';
import 'send_money_screen.dart';
import 'receive_money.dart';
import 'top_up_screen.dart';
import '../profile/profile_screen.dart';
import '../support/support_screen.dart';
import '../paybills/paybills_screen.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text("QikiPay Wallet", style: TextStyle(color: Colors.white)),
          ],
        ),
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
            const SizedBox(height: 24),
            // Quick Actions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SendMoneyScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.send,
                    label: 'Send Money',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ReceiveMoneyScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.call_received,
                    label: 'Receive Money',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TopUpScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.add_card,
                    label: 'Top Up',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.person,
                    label: 'Profile',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SupportScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.support_agent,
                    label: 'Support',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PayBillsScreen(),
                      ),
                    );
                  },
                  child: _buildQuickAction(
                    context,
                    icon: Icons.receipt_long,
                    label: 'Pay Bills',
                  ),
                ),
              ],
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
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.primary,
        alignment: Alignment.center,
        child: const Text(
          '© 2024 QikiPay. All rights reserved.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context,
      {required IconData icon, required String label}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.primary,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
