import 'package:seat_scheduler_mobile/models/login_model.dart';

abstract interface class LoginRepository {
  Future<LoginModel> makeLogin(String email, String password) {}
}
