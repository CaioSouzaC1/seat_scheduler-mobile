import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';

abstract class StoreRepository {
  Future<dynamic> fetchStore();
}
