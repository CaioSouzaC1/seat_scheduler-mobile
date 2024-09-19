import 'package:seat_scheduler_mobile/models/api_root.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/models/paginate_root.dart';

abstract class BookingsRepository {
  Future<ApiPaginateRoot<BookingModel>> getBookings();
  Future<ApiRoot<BookingModel>> getBooking(String id);
  Future<void> resgiterBooking({required BookingRequest booking});
}
