import 'dart:convert';
import 'package:seat_scheduler_mobile/models/address_model.dart';
import 'company_attachement_model.dart';

class CompanyModel {
  final String id;
  final String name;
  final String cnpj;
  final String addressId;
  final String userId;
  final String createdAt;
  final String updatedAt;
  final List<CompanyAttachement>? attachments;
  final AddressModel address;

  CompanyModel(
      {required this.id,
      required this.name,
      required this.cnpj,
      required this.addressId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      this.attachments,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cnpj': cnpj,
      'addressId': addressId,
      'address': address.toMap(),
      'userId': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'attachments':
          attachments?.map((attachment) => attachment.toMap()).toList(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
        id: map['id'],
        name: map['name'],
        cnpj: map['cnpj'],
        address: AddressModel?.fromMap(map['address']),
        userId: map['userId'],
        addressId: map['addressId'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        attachments: map['attachments'] != null
            ? (map['attachments'] as List)
                .map((attachment) => CompanyAttachement.fromMap(attachment))
                .toList()
            : []);
  }

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));
}
