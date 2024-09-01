import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/models/paginate_root.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  @override
  Future<ApiPaginateRoot<StoreModel>> fetchStore() async {
    try {
      final dio = await createDio();

      final result = await dio.get("/stores");

      return ApiPaginateRoot<StoreModel>.fromMap(
          result.data, (data) => StoreModel.fromMap(data));
    } on DioException catch (e) {
      log(e.message ?? "");
      throw Exception("Erro ao trazer as lojas");
    }
  }
}
