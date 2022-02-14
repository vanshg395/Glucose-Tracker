import 'dart:convert';

class LoginCredential {
  String username;
  String password;

  LoginCredential({
    required this.username,
    required this.password,
  });

  LoginCredential copyWith({
    String? username,
    String? password,
  }) {
    return LoginCredential(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginCredential.fromMap(Map<String, dynamic> map) {
    return LoginCredential(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginCredential.fromJson(String source) =>
      LoginCredential.fromMap(json.decode(source));
}
