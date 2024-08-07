import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/models/login_model.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel> makeLogin(String email, String password) async {
    try {
      final result = await Dio().post('http://localhost:3333/login');
      return LoginModel.fromMap(result.data);
    } on DioException catch (e) {
      log(e.message ?? '');
      throw Exception('Erro ao logar');
    }
  }
}
