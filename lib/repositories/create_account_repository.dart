import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/create_account_model.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';

class CreateAccountResponse {
  final UserModel user;
  final String token;

  CreateAccountResponse({required this.user, required this.token});

  factory CreateAccountResponse.fromMap(Map<String, dynamic> map) {
    return CreateAccountResponse(
      user: UserModel.fromMap(map['user']),
      token: map['token'],
    );
  }
}

abstract class CreateAccountRepository {
  Future<ApiRoot<CreateAccountResponse>> createAccount(
      {required CreateAccountModel createAccount});
}
