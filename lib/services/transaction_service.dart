import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final _txRef = FirebaseFirestore.instance.collection('transactions');

  Future<List<TransactionModel>> getUserTransactions(String uid) async {
    try {
      final snapshot = await _txRef
          .where('userId', isEqualTo: uid)
          .orderBy('timestamp', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Transaction fetch error: $e');
      return [];
    }
  }

  Future<void> addTransaction(TransactionModel tx) async {
    try {
      await _txRef.doc(tx.id).set(tx.toJson());
    } catch (e) {
      print('Transaction add error: $e');
    }
  }
}
