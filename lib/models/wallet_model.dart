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
      uid: json['uid'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'NGN',
      lastUpdated:
          DateTime.tryParse(json['lastUpdated'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'balance': balance,
        'currency': currency,
        'lastUpdated': lastUpdated.toIso8601String(),
      };

  WalletModel copyWith({
    String? uid,
    double? balance,
    String? currency,
    DateTime? lastUpdated,
  }) {
    return WalletModel(
      uid: uid ?? this.uid,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
