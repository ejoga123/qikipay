import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/wallet_model.dart';

class WalletService {
  final _walletRef = FirebaseFirestore.instance.collection('wallets');

  Future<WalletModel?> getUserWallet(String uid) async {
    try {
      final doc = await _walletRef.doc(uid).get();
      if (!doc.exists) return null;

      return WalletModel.fromJson(doc.data()!);
    } catch (e) {
      print('Wallet fetch error: $e');
      return null;
    }
  }

  Future<void> updateWalletBalance(String uid, double newBalance) async {
    try {
      await _walletRef.doc(uid).update({
        'balance': newBalance,
        'lastUpdated': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Wallet update error: $e');
    }
  }
}
