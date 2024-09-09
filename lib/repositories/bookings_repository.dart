import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/models/paginate_root.dart';

abstract class BookingsRepository {
  Future<ApiPaginateRoot<BookingModel>> getBookings();
}
