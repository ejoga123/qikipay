class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? profileImage;
  final DateTime? createdAt;
  final double balance;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.profileImage,
    this.createdAt,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt']) ?? DateTime.now()
          : null,
      balance: (json['balance'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'displayName': displayName,
        'phoneNumber': phoneNumber,
        'profileImage': profileImage,
        'createdAt': createdAt?.toIso8601String(),
        'balance': balance,
      };

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? phoneNumber,
    String? profileImage,
    DateTime? createdAt,
    double? balance,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      balance: balance ?? this.balance,
    );
  }
}
