class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final UserStatus status;
  final UserRole role;
  final UserPreferences preferences;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.status,
    required this.role,
    required this.preferences,
  });

  // Getter for full name
  String get fullName => '$firstName $lastName';
  
  // Getter for display name (first name + last initial)
  String get displayName => '$firstName ${lastName[0]}.';
  
  // Getter for initials
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();

  // Copy with method for immutability
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    UserStatus? status,
    UserRole? role,
    UserPreferences? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      status: status ?? this.status,
      role: role ?? this.role,
      preferences: preferences ?? this.preferences,
    );
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  // Hash code
  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode;
  }

  // To string method
  @override
  String toString() {
    return 'User(id: $id, email: $email, fullName: $fullName, status: $status)';
  }
}

// User status enum
enum UserStatus {
  active('Active'),
  inactive('Inactive'),
  suspended('Suspended'),
  pending('Pending'),
  blocked('Blocked');

  const UserStatus(this.displayName);
  final String displayName;
}

// User role enum
enum UserRole {
  user('User'),
  premium('Premium'),
  business('Business'),
  admin('Admin');

  const UserRole(this.displayName);
  final String displayName;
}

// User preferences
class UserPreferences {
  final String language;
  final String currency;
  final bool enableBiometric;
  final bool enablePushNotifications;
  final bool enableEmailNotifications;
  final bool enableSmsNotifications;
  final String theme;
  final bool enableAnalytics;

  const UserPreferences({
    this.language = 'en',
    this.currency = 'USD',
    this.enableBiometric = true,
    this.enablePushNotifications = true,
    this.enableEmailNotifications = true,
    this.enableSmsNotifications = false,
    this.theme = 'light',
    this.enableAnalytics = true,
  });

  UserPreferences copyWith({
    String? language,
    String? currency,
    bool? enableBiometric,
    bool? enablePushNotifications,
    bool? enableEmailNotifications,
    bool? enableSmsNotifications,
    String? theme,
    bool? enableAnalytics,
  }) {
    return UserPreferences(
      language: language ?? this.language,
      currency: currency ?? this.currency,
      enableBiometric: enableBiometric ?? this.enableBiometric,
      enablePushNotifications: enablePushNotifications ?? this.enablePushNotifications,
      enableEmailNotifications: enableEmailNotifications ?? this.enableEmailNotifications,
      enableSmsNotifications: enableSmsNotifications ?? this.enableSmsNotifications,
      theme: theme ?? this.theme,
      enableAnalytics: enableAnalytics ?? this.enableAnalytics,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserPreferences &&
        other.language == language &&
        other.currency == currency &&
        other.enableBiometric == enableBiometric &&
        other.enablePushNotifications == enablePushNotifications;
  }

  @override
  int get hashCode {
    return language.hashCode ^
        currency.hashCode ^
        enableBiometric.hashCode ^
        enablePushNotifications.hashCode;
  }
}
