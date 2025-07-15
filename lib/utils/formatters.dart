import 'package:intl/intl.dart';

class Formatters {
  static String formatCurrency(double amount, {String symbol = '₦'}) {
    final formatter = NumberFormat.currency(symbol: symbol, decimalDigits: 2);
    return formatter.format(amount);
  }

  static String formatDate(DateTime date, {bool showTime = false}) {
    final formatter =
        DateFormat(showTime ? 'dd MMM yyyy, hh:mm a' : 'dd MMM yyyy');
    return formatter.format(date);
  }

  static String formatPhone(String phone) {
    // Example: 08012345678 → 080 1234 5678
    if (phone.length == 11) {
      return '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7)}';
    }
    return phone;
  }

  static String formatTransactionType(String type) {
    switch (type.toLowerCase()) {
      case 'topup':
        return 'Wallet Top-up';
      case 'transfer':
        return 'Sent Money';
      case 'receive':
        return 'Received Money';
      default:
        return 'Transaction';
    }
  }
}
