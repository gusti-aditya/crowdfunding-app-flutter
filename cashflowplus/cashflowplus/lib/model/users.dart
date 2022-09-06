import 'package:flutter/foundation.dart';

class Users {
  late final String? customer_id;
  late final String? email;
  late final String? password;
  late final String? phone_no;
  late final String? is_verified;
  late final String token;

  Users(
      {this.customer_id,
      this.email,
      this.password,
      this.phone_no,
      this.is_verified,
      required this.token});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      token: json['token'] ?? 0,
      customer_id: json['token'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      is_verified: json['is_verified'] ?? 0);

  Map<String, dynamic> toJson() {
    var map = {
      'name': this.customer_id ?? '',
      'username': this.email ?? '',
      'email': this.token ?? ''
    };

    if (map['business_id'] != null) map['business_id'] = this.customer_id ?? '';

    return map;
  }
}
