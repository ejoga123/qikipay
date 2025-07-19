class TransactionModel {
  final String id;
  final String type; // 'send', 'receive', 'topup', etc.
  final double amount;
  final DateTime timestamp;
  final String status;
  final String title;
  final bool isDebit;

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.status,
    required this.title,
    required this.isDebit,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      status: json['status'] ?? 'pending',
      title: json['title'] ?? 'Transaction',
      isDebit: json['isDebit'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'amount': amount,
        'timestamp': timestamp.toIso8601String(),
        'status': status,
        'title': title,
        'isDebit': isDebit,
      };

  TransactionModel copyWith({
    String? id,
    String? type,
    double? amount,
    DateTime? timestamp,
    String? status,
    String? title,
    bool? isDebit,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      title: title ?? this.title,
      isDebit: isDebit ?? this.isDebit,
    );
  }
}
