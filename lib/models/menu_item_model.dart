import 'dart:convert';

import 'store_model.dart';

class MenuItemModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String storeId;
  final StoreModel? store;
  final String createdAt;
  final String updatedAt;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.storeId,
    required this.store,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'storeId': storeId,
      'store': store?.toMap() ?? {},
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory MenuItemModel.fromMap(Map<String, dynamic> map) {
    return MenuItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      storeId: map['storeId'],
      store: map['store'] != null ? StoreModel.fromMap(map['store']) : null,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory MenuItemModel.fromJson(String source) =>
      MenuItemModel.fromMap(json.decode(source));
}
