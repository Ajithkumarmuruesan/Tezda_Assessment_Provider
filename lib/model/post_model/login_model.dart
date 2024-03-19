import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
  });

  final String? username;
  final String? password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
