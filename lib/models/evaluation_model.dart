import 'dart:convert';

import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';

class EvaluationModel {
  final String id;
  final String note;
  final String description;
  final String userId;
  final String storeId;
  final UserModel? user;
  final StoreModel? store;
  final String createdAt;
  final String updatedAt;

  EvaluationModel({
    required this.id,
    required this.note,
    required this.description,
    required this.userId,
    required this.storeId,
    required this.user,
    required this.store,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
      'user': user?.toMap(),
      'store': store?.toMap(),
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory EvaluationModel.fromMap(Map<String, dynamic> map) {
    return EvaluationModel(
      id: map['id'],
      note: map['note'],
      description: map['description'],
      userId: map['userId'],
      storeId: map['storeId'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      store: map['store'],
    );
  }

  factory EvaluationModel.fromJson(String source) =>
      EvaluationModel.fromMap(json.decode(source));
}
