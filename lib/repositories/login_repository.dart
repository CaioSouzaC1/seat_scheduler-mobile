import '../models/api_root.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';

abstract class LoginRepository {
  Future<ApiRoot<UserModel>> makeLogin({required LoginModel login});
  Future<bool> checkValidateToken();
}
