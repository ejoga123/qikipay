class UserModel {
  final String uid;
  final String email;
  final double balance;

  UserModel({required this.uid, required this.email, required this.balance});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      balance: map['balance']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'balance': balance,
    };
  }
}
