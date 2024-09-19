import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';

import '../models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<ApiRoot<UserModel>> makeLogin({required LoginModel login}) async {
    try {
      final dio = await createDio();

      final result = await dio.post('/login', data: login.toMap());

      return ApiRoot<UserModel>.fromMap(
        result.data,
        (data) => UserModel.fromMap(data['user']),
      );
    } on DioException catch (e) {
      log(e.message ?? '');
      throw Exception('Erro ao logar');
    }
  }

  @override
  Future<bool> checkValidateToken() async {
    try {
      final dio = await createDio();

      await dio.get('/checktoken');

      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return false;
      }
      throw Exception(e.message);
    }
  }
}
