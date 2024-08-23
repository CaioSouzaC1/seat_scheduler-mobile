import 'package:get_storage/get_storage.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<String?> getTokenFromLocalStorage() async {
    final box = GetStorage();
    return box.read("token");
  }

  @override
  Future<void> setTokenInLocalStorage(String token) async {
    final box = GetStorage();

    box.write("token", token);
  }
}
