class LoginModel {
  final String id;
  final String email;
  final String phone;
  final String firstname;
  final String lastname;
  final bool active;
  final String accessToken;

  LoginModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.active,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['user']['id'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      firstname: json['user']['firstname'] ?? '',
      lastname: json['user']['lastname'] ?? '',
      active: json['user']['active'] ?? false,
      accessToken: json['accessToken'],
    );
  }
}
