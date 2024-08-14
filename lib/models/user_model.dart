import 'dart:convert';

import 'address_model.dart';
import 'company_model.dart';

class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String lastLogin;
  final int loginCount;
  final AddressModel address;
  final CompanyModel? company;
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
    this.company,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'address': address.toMap(),
      'company': company?.toMap(),
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
      createdAt: map["createdAt"],
      updatedAt: map["updatedAt"],
      address: AddressModel.fromMap(map["address"]),
      company: (map['company'] != null)
          ? CompanyModel.fromMap(map["company"])
          : null,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
