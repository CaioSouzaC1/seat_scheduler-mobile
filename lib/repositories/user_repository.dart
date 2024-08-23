import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';

abstract class UserRepository {
    Future<ApiRoot<UserModel>> getMe();
}
