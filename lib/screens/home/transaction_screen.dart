import 'package:flutter/material.dart';
import '../../services/transaction_service.dart';
import '../../models/transaction_model.dart';
import '../../widgets/transaction_item.dart';
import '../../widgets/transaction_title.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<TransactionModel> transactions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    const uid = 'user123'; // Replace with actual user ID
    final txList = await TransactionService().getUserTransactions(uid);
    setState(() {
      transactions = txList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : transactions.isEmpty
              ? const Center(child: Text('No transactions found'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0 || _isNewDateGroup(index))
                          TransactionTitle(
                            label: _formatDate(tx.timestamp),
                          ),
                        TransactionItem(transaction: tx),
                        const Divider(),
                      ],
                    );
                  },
                ),
    );
  }

  bool _isNewDateGroup(int index) {
    final current = transactions[index].timestamp;
    final previous = transactions[index - 1].timestamp;
    return current.day != previous.day ||
        current.month != previous.month ||
        current.year != previous.year;
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
