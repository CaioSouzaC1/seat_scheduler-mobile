abstract class LocalStorageRepository {
  Future<void> setTokenInLocalStorage(String token);
  Future<String?> getTokenFromLocalStorage();
  Future<void> deleteTokenFromLocalStorage();
}
