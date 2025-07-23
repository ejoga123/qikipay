class UserModel {
  final String uid;
  final String email;
  final String? firstName;
  final String? sureName;
  final String? displayName;
  final String? phoneNumber;
  final String? address;
  final String? profileImage;
  final DateTime? createdAt;
  final double balance;

  UserModel({
    required this.uid,
    required this.email,
    this.firstName,
    this.sureName,
    this.displayName,
    this.phoneNumber,
    this.address,
    this.profileImage,
    this.createdAt,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'],
      sureName: json['sureName'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
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
        'firstName': firstName,
        'sureName': sureName,
        'displayName': displayName,
        'phoneNumber': phoneNumber,
        'address': address,
        'profileImage': profileImage,
        'createdAt': createdAt?.toIso8601String(),
        'balance': balance,
      };

  UserModel copyWith({
    String? uid,
    String? email,
    String? firstName,
    String? sureName,
    String? displayName,
    String? phoneNumber,
    String? address,
    String? profileImage,
    DateTime? createdAt,
    double? balance,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      sureName: sureName ?? this.sureName,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      balance: balance ?? this.balance,
    );
  }
}
