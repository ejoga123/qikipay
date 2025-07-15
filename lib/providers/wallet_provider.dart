import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  double _balance = 0.0;
  String _currency = '₦';

  double get balance => _balance;
  String get currency => _currency;

  void setBalance(double newBalance) {
    _balance = newBalance;
    notifyListeners();
  }

  void addFunds(double amount) {
    _balance += amount;
    notifyListeners();
  }

  void deductFunds(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      notifyListeners();
    }
  }

  void setCurrency(String newCurrency) {
    _currency = newCurrency;
    notifyListeners();
  }

  void resetWallet() {
    _balance = 0.0;
    _currency = '₦';
    notifyListeners();
  }
}
