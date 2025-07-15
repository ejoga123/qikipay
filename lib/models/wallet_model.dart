class WalletModel {
  final String uid;
  final double balance;
  final String currency;
  final DateTime lastUpdated;

  WalletModel({
    required this.uid,
    required this.balance,
    required this.currency,
    required this.lastUpdated,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      uid: json['uid'],
      balance: json['balance'],
      currency: json['currency'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'balance': balance,
        'currency': currency,
        'lastUpdated': lastUpdated.toIso8601String(),
      };
}
