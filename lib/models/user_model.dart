import 'dart:convert';

import 'package:seat_scheduler_mobile/models/address_model.dart';

class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String lastLogin;
  final int loginCount;
  final AddressModel address;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.lastLogin,
    required this.loginCount,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'lastLogin': lastLogin,
      'loginCount': loginCount,
      'address': address,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["id"],
        name: map["name"],
        phone: map["phone"],
        email: map["email"],
        lastLogin: map["lastLogin"],
        loginCount: map["loginCount"],
        address: map["loginCount"],
        createdAt: map["createdAt"],
        updatedAt: map["updatedAt"]);
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
