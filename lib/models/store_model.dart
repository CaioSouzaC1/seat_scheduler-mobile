import 'dart:convert';

import 'package:seat_scheduler_mobile/models/address_model.dart';
import 'package:seat_scheduler_mobile/models/company_model.dart';
import 'package:seat_scheduler_mobile/models/evaluation_model.dart';
import 'package:seat_scheduler_mobile/models/menu_item_model.dart';
import 'package:seat_scheduler_mobile/models/store_attachement_model.dart';
import 'package:seat_scheduler_mobile/models/table_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String phone;
  String? description;
  AddressModel? address;
  CompanyModel? company;
  List<StoreAttachement>? attachments;
  EvaluationModel? evaluaion;
  List<MenuItemModel>? menu;
  List<TableModel>? table;
  final String createdAt;
  final String updatedAt;

  StoreModel({
    required this.id,
    required this.name,
    required this.phone,
    this.description,
    this.address,
    this.company,
    this.attachments,
    this.evaluaion,
    this.menu,
    this.table,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'menu': menu?.map((menu) => menu.toMap()).toList() ?? [],
      'description': description ?? "",
      'address': address?.toMap() ?? {},
      'company': company?.toMap() ?? {},
      'evaluation': evaluaion?.toMap() ?? {},
      'attachments':
          attachments?.map((attachment) => attachment.toMap()).toList() ?? [],
      'table': table?.map((table) => table.toMap()).toList() ?? [],
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory StoreModel.fromMap(dynamic map) {
    return StoreModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      description: map['description'],
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      company:
          map['company'] != null ? CompanyModel.fromMap(map['company']) : null,
      attachments: map['attachement'] != null
          ? (map['attachement'] as List)
              .map((attachment) => StoreAttachement.fromMap(attachment))
              .toList()
          : [],
      evaluaion: map['evaluation'] != null
          ? EvaluationModel.fromMap(map['evaluation'])
          : null,
      menu: map['menuItem'] != null
          ? (map['menuItem'] as List)
              .map((menu) => MenuItemModel.fromMap(menu))
              .toList()
          : [],
      table: map['tables'] != null
          ? (map['tables'] as List)
              .map((table) => TableModel.fromMap(table))
              .toList()
          : [],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory StoreModel.fromJson(String source) => StoreModel.fromMap(
        json.decode(source),
      );
}
