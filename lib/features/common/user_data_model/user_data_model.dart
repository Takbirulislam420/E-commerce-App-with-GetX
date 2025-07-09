class UserDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String emailVerified;
  final String phone;
  final String phoneVerified;
  final String avatarUrl;
  final String city;
  final String role;

  UserDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.phoneVerified,
    required this.avatarUrl,
    required this.city,
    required this.role,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
      id: jsonData['_id'] ?? '',
      firstName: jsonData['first_name'] ?? '',
      lastName: jsonData['last_name'] ?? '',
      email: jsonData['email'] ?? '',
      emailVerified: (jsonData['email_verified'] ?? false).toString(),
      phone: jsonData['phone'] ?? '',
      phoneVerified: (jsonData['phone_verified'] ?? false).toString(),
      avatarUrl: jsonData['avatar_url'] ?? '',
      city: jsonData['city'] ?? '',
      role: (jsonData['role'] ?? 0).toString(),
    );
  }

  Map<String, String> toJson() {
    return {};
  }
}
