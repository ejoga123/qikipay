class TransactionModel {
  final String id;
  final String type; // 'send', 'receive', 'topup', etc.
  final double amount;
  final DateTime timestamp;
  final String status;

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: json['type'],
      amount: json['amount'],
      timestamp: DateTime.parse(json['timestamp']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'amount': amount,
        'timestamp': timestamp.toIso8601String(),
        'status': status,
      };
}
