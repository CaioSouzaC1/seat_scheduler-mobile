import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/models/paginate_root.dart';
import 'package:seat_scheduler_mobile/repositories/bookings_repository.dart';

class BookingsRepositoryImpl extends BookingsRepository {
  @override
  Future<ApiPaginateRoot<BookingModel>> getBookings() async {
    try {
      final dio = await createDio();

      final result = await dio.get(
        "/books",
        queryParameters: {"limit": 10, "page": 1, "status": "scheduled"},
      );

      return ApiPaginateRoot<BookingModel>.fromMap(
          result.data, (data) => BookingModel.fromMap(data));
    } on DioException catch (e) {
      log(e.message ?? "");
      throw Exception("Erro ao trazer as reservas");
    }
  }

  @override
  Future<ApiRoot<BookingModel>> getBooking(String id) async {
    try {
      final dio = await createDio();

      final result = await dio.get('/books/$id');

      return ApiRoot<BookingModel>.fromMap(
          result.data, (data) => BookingModel.fromMap(data));
    } on DioException catch (e) {
      log(e.message ?? "");
      throw Exception("Erro ao trazer as reservas");
    }
  }

  @override
  Future<void> resgiterBooking({required BookingRequest booking}) async {
    try {
      final dio = await createDio();
      await dio.post('/books', data: booking.toMap());
    } on DioException catch (e) {
      log(e.message ?? "");
      throw Exception("Error ao reservar");
    }
  }
}
