import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  void setTransactions(List<TransactionModel> list) {
    _transactions.clear();
    _transactions.addAll(list);
    notifyListeners();
  }

  void addTransaction(TransactionModel transaction) {
    _transactions.insert(0, transaction); // Add to top
    notifyListeners();
  }

  void updateTransaction(String id, TransactionModel updated) {
    final index = _transactions.indexWhere((tx) => tx.id == id);
    if (index != -1) {
      _transactions[index] = updated;
      notifyListeners();
    }
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

  TransactionModel? getById(String id) {
    try {
      return _transactions.firstWhere((tx) => tx.id == id);
    } catch (e) {
      return null;
    }
  }

  void clearAll() {
    _transactions.clear();
    notifyListeners();
  }
}
