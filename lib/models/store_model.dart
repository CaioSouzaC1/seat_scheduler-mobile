import 'dart:convert';

import 'package:seat_scheduler_mobile/models/address_model.dart';
import 'package:seat_scheduler_mobile/models/company_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String phone;
  String? description;
  final AddressModel address;
  final CompanyModel company;
  final String createdAt;
  final String updatedAt;

  StoreModel(
      {required this.id,
      required this.name,
      required this.phone,
      this.description,
      required this.address,
      required this.company,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'description': description ?? "",
      'address': address.toMap(),
      'company': company.toMap(),
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      address: AddressModel.fromMap(map['address']),
      company: CompanyModel.fromMap(map['company']),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory StoreModel.fromJson(String source) => StoreModel.fromMap(
        json.decode(source),
      );
}
