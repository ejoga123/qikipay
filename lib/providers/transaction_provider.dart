import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];
  bool _isLoading = false;

  List<TransactionModel> get transactions => _transactions;
  bool get isLoading => _isLoading;

  void setTransactions(List<TransactionModel> txList) {
    _transactions = txList;
    notifyListeners();
  }

  void addTransaction(TransactionModel tx) {
    _transactions.insert(0, tx); // Add to top
    notifyListeners();
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

  void updateTransaction(TransactionModel updatedTx) {
    final index = _transactions.indexWhere((tx) => tx.id == updatedTx.id);
    if (index != -1) {
      _transactions[index] = updatedTx;
      notifyListeners();
    }
  }

  Future<void> fetchTransactions() async {
    _isLoading = true;
    notifyListeners();

    // TODO: Replace with actual fetch logic (e.g. Firestore or API)
    await Future.delayed(const Duration(seconds: 1));
    _transactions = [
      TransactionModel(
        id: 'tx1',
        amount: 5000,
        type: 'topup',
        description: 'Wallet Top-up',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      TransactionModel(
        id: 'tx2',
        amount: -2500,
        type: 'transfer',
        description: 'Sent to user123',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
