import 'package:seat_scheduler_mobile/models/paginate_root.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';

abstract class StoreRepository {
  Future<ApiPaginateRoot<StoreModel>> fetchStore();
}
