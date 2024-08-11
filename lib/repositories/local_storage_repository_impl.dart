import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<String> getTokenFromLocalStorage() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();

    final token = localStorage.getString("token");

    return token!;
  }

  @override
  Future<void> setTokenInLocalStorage(String token) async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    localStorage.setString("token", token);
  }
}
