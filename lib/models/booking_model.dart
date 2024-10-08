import 'dart:convert';

import 'package:seat_scheduler_mobile/models/store_model.dart';

class BookingModel {
  final String id;
  final String status;
  final String? observation;
  final String reservedDate;
  final String userId;
  final String tableId;
  final String storeId;
  final String createdAt;
  final String updatedAt;
  StoreModel store;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'observation': observation,
      'reservedDate': reservedDate,
      'userId': userId,
      'tableId': tableId,
      'storeId': storeId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'store': store.toMap(),
    };
  }

  BookingModel({
    required this.id,
    required this.status,
    required this.observation,
    required this.reservedDate,
    required this.userId,
    required this.tableId,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
    required this.store,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map["id"],
      status: map["status"],
      observation: map["observation"] ?? '',
      reservedDate: map["reservedDate"],
      userId: map["userId"],
      tableId: map["tableId"],
      storeId: map["storeId"],
      createdAt: map["createdAt"],
      updatedAt: map["updatedAt"],
      store: StoreModel.fromMap(map["store"]),
    );
  }

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source));
}

class BookingRequest {
  final String tableId;
  final String reservedDate;
  final String storeId;

  BookingRequest({
    required this.tableId,
    required this.reservedDate,
    required this.storeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'tableId': tableId,
      'reservedDate': reservedDate,
      'storeId': storeId
    };
  }
}
