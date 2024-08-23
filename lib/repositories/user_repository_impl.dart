import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';
import 'package:seat_scheduler_mobile/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<ApiRoot<UserModel>> getMe() async {
    try {
      final dio = await createDio();

      final result = await dio.get('/me');

      return ApiRoot<UserModel>.fromMap(
          result.data, (data) => UserModel.fromMap(data));
    } on DioException catch (e) {
      log(e.message ?? "");
      throw Exception("Erro trazer informações do perfil");
    }
  }
}
