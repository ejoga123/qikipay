import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../services/auth_service.dart';
import '../../services/transaction_service.dart';
import '../../models/transaction_model.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final _authService = AuthService();
  final _transactionService = TransactionService();

  List<TransactionModel> _allTransactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    final user = _authService._auth.currentUser;
    if (user != null) {
      final txns = await _transactionService.getTransactions(user.uid);
      setState(() {
        _allTransactions = txns;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction History")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _allTransactions.isEmpty
              ? const Center(child: Text("No transactions found"))
              : ListView.builder(
                  padding: const EdgeInsets.all(AppPadding.horizontal),
                  itemCount: _allTransactions.length,
                  itemBuilder: (context, index) {
                    final tx = _allTransactions[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(
                          tx.isDebit
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: tx.isDebit ? Colors.red : Colors.green,
                        ),
                        title: Text(tx.title),
                        subtitle: Text(
                          tx.timestamp.toLocal().toString().split('.').first,
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "${tx.isDebit ? '-' : '+'}₦${tx.amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: tx.isDebit ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
