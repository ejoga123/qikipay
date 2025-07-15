import 'package:flutter/material.dart';
import '../../widgets/balance_card.dart';
import '../../services/wallet_service.dart';
import '../../models/wallet_model.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  WalletModel? wallet;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadWallet();
  }

  Future<void> loadWallet() async {
    const uid = 'user123'; // Replace with actual user ID from auth
    final fetchedWallet = await WalletService().getUserWallet(uid);
    setState(() {
      wallet = fetchedWallet;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : wallet == null
              ? const Center(child: Text('No wallet data found'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      BalanceCard(
                        balance: wallet!.balance,
                        currency: wallet!.currency,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Add top-up logic
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Top Up'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
