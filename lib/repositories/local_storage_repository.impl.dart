import 'package:get_storage/get_storage.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final box = GetStorage();
  @override
  Future<String?> getTokenFromLocalStorage() async {
    return box.read("token");
  }

  @override
  Future<void> setTokenInLocalStorage(String token) async {
    box.write("token", token);
  }

  @override
  Future<void> deleteTokenFromLocalStorage() async {
    box.remove("token");
  }
}
