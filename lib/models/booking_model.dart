import 'dart:convert';

class BookingModel {
  final String id;
  final int number;
  final String observation;
  final String status;
  final int numberOfChairs;
  final String createdAt;
  final String updatedAt;

  BookingModel({
    required this.id,
    required this.number,
    required this.observation,
    required this.status,
    required this.numberOfChairs,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
        id: map["id"],
        number: map["number"],
        observation: map["observation"],
        status: map["status"],
        numberOfChairs: map["numberOfChairs"],
        createdAt: map["createdAt"],
        updatedAt: map["updatedAt"]);
  }

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source));
}
