import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/repositories/bookings_repository.dart';

import '../repositories/bookings_repository.impl.dart';

class ShowBookingPage extends StatefulWidget {
  final String bookingId;

  const ShowBookingPage({super.key, required this.bookingId});

  @override
  State<ShowBookingPage> createState() => _ShowBookingPageState();
}

class _ShowBookingPageState extends State<ShowBookingPage> {
  final BookingsRepository bookingsRepository = BookingsRepositoryImpl();
  BookingModel? _booking;

  @override
  void initState() {
    super.initState();
    getStore();
  }

  Future<void> getStore() async {
    final result = await bookingsRepository.getBooking(widget.bookingId);
    setState(() {
      _booking = result.data;
    });
  }

  showStore(String id) {
    Navigator.of(context).pushNamed('/show_store', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da reserva"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Reserva para: ${_booking?.reservedDate}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                showStore(_booking?.store.id ?? "");
              },
              child: Card(
                color: Colors.red,
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.store,
                              color: Colors.blue[50],
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Ver Loja',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _booking?.store.name ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '-',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              _booking?.store.phone ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  '#',
                  style: TextStyle(fontSize: 10),
                ),
                _booking != null
                    ? Text(
                        _booking!.id,
                        style: const TextStyle(fontSize: 10),
                      )
                    : const CircularProgressIndicator()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
