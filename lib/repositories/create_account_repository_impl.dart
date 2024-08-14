import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/api/dio_api.dart';
import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/create_account_model.dart';
import 'package:seat_scheduler_mobile/repositories/create_account_repository.dart';

class CreateAccountRepositoryImpl implements CreateAccountRepository {
  @override
  Future<ApiRoot<CreateAccountResponse>> createAccount(
      {required CreateAccountModel createAccount}) async {
    try {
      final result =
          await dio.post('/users/client', data: createAccount.toMap());

      return ApiRoot<CreateAccountResponse>.fromMap(
          result.data, (data) => CreateAccountResponse.fromMap(data));
    } on DioException catch (e) {
      log(e.message ?? '');
      throw Exception('Erro ao criar conta');
    }
  }
}
