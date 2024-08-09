import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<dynamic> makeLogin(String email, String password) async {
    try {
      final result = await dio
          .post('/login', data: {'email': email, 'password': password});
      // return LoginModel.fromMap(result.data);
      return result;
    } on DioException catch (e) {
      log(e.message ?? '');
      throw Exception('Erro ao logar');
    }
  }
}
