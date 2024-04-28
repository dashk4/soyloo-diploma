class UserModel {
  String id;
  String email;
  String phone;
  bool active;
  String accessToken;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.active,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      active: json['user']['active'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id': id,
        'email': email,
        'phone': phone,
        'active': active,
      },
      'accessToken': accessToken,
    };
  }
}
