import 'dart:convert';

import 'package:seat_scheduler_mobile/models/store_model.dart';

import 'booking_model.dart';

class TableModel {
  final String id;
  final int number;
  final int numberOfChairs;
  final String observation;
  final String status;
  final String storeId;
  final StoreModel? store;
  final BookingModel? booking;
  final String createdAt;
  final String updatedAt;

  TableModel({
    required this.id,
    required this.number,
    required this.numberOfChairs,
    required this.observation,
    required this.status,
    required this.storeId,
    this.store,
    this.booking,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'numberOfChairs': numberOfChairs,
      'observation': observation,
      'status': status,
      'storeId': storeId,
      'store': store?.toMap() ?? {},
      'booking': booking?.toMap() ?? {},
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'],
      number: map['number'],
      numberOfChairs: map['numberOfChairs'],
      observation: map['observation'],
      status: map['status'],
      storeId: map['storeId'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory TableModel.fromJson(String source) =>
      TableModel.fromMap(json.decode(source));
}
