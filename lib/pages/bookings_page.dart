import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/components/card_booking.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/repositories/bookings_repository.dart';

import '../repositories/bookings_repository.impl.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final BookingsRepository bookingsRepository = BookingsRepositoryImpl();
  List<BookingModel>? _booking;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    try {
      final result = await bookingsRepository.getBookings();
      setState(() {
        _booking = result.data;
      });
    } catch (e) {
      rethrow;
    }
  }

  showBooking(String id) {
    Navigator.of(context).pushNamed('/show_booking', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas reservas"),
      ),
      body: ListView(
        children: _booking != null
            ? _booking!
                .map(
                  (booking) => CardBooking(
                    booking: booking,
                    showBooking: showBooking,
                  ),
                )
                .toList()
            : [
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
      ),
    );
  }
}
