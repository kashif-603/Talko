class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? profileImage;
  final String? about;
  final DateTime? createdAt;
  final DateTime? lastOnlineStatus;
  final String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
  });

  // Convert UserModel to Map (for Firebase or JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'about': about,
      'createdAt': createdAt?.toIso8601String(),
      'lastOnlineStatus': lastOnlineStatus?.toIso8601String(),
      'status': status,
    };
  }

  // Create UserModel from Map (from Firebase or JSON)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profileImage: json['profileImage'] ?? '',
      about: json['about'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      lastOnlineStatus: json['lastOnlineStatus'] != null ? DateTime.parse(json['lastOnlineStatus']) : null,
      status: json['status'] ?? '',
    );
  }
}
