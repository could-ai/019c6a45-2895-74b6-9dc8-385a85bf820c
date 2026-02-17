class User {
  final String id;
  final String email;
  final String? phoneNumber;
  final String fullName;
  final String? profileImageUrl;
  final List<Address> addresses;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final UserRole role;

  User({
    required this.id,
    required this.email,
    this.phoneNumber,
    required this.fullName,
    this.profileImageUrl,
    this.addresses = const [],
    required this.createdAt,
    this.lastLoginAt,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.role = UserRole.customer,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((a) => Address.fromJson(a as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] as String),
      lastLoginAt: json['last_login_at'] != null
          ? DateTime.parse(json['last_login_at'] as String)
          : null,
      isEmailVerified: json['is_email_verified'] as bool? ?? false,
      isPhoneVerified: json['is_phone_verified'] as bool? ?? false,
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.customer,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'profile_image_url': profileImageUrl,
      'addresses': addresses.map((a) => a.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'last_login_at': lastLoginAt?.toIso8601String(),
      'is_email_verified': isEmailVerified,
      'is_phone_verified': isPhoneVerified,
      'role': role.name,
    };
  }
}

class Address {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isDefault;
  final AddressType type;

  Address({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.isDefault = false,
    this.type = AddressType.home,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      addressLine1: json['address_line_1'] as String,
      addressLine2: json['address_line_2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postal_code'] as String,
      country: json['country'] as String,
      isDefault: json['is_default'] as bool? ?? false,
      type: AddressType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AddressType.home,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'is_default': isDefault,
      'type': type.name,
    };
  }

  String get fullAddress {
    final line2 = addressLine2?.isNotEmpty == true ? ', $addressLine2' : '';
    return '$addressLine1$line2, $city, $state $postalCode, $country';
  }
}

enum UserRole {
  customer,
  admin,
  seller,
}

enum AddressType {
  home,
  work,
  other,
}