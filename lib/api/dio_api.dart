import 'package:dio/dio.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';

import '../repositories/local_storage_repository.impl.dart';

final LocalStorageRepository localStorageRepository =
    LocalStorageRepositoryImpl();
Future<Dio> createDio() async {
  final token = await localStorageRepository.getTokenFromLocalStorage() ?? "";

  final dio = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:3333', headers: {
      'Authorization': 'Bearer $token',
    }),
  );

  return dio;
}
