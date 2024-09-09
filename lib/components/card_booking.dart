import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

class CardBooking extends StatefulWidget {
  final BookingModel booking;
  final Function showBooking;

  const CardBooking({
    super.key,
    required this.booking,
    required this.showBooking,
  });

  @override
  State<CardBooking> createState() => _CardBookingState();
}

class _CardBookingState extends State<CardBooking> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.showBooking(widget.booking.id);
      },
      child: Card(
        color: Colors.red,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.booking.reservedDate,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '-',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.booking.store.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      widget.booking.status == "available"
                          ? Icons.crop_free
                          : widget.booking.status == "scheduled"
                              ? Icons.check_circle
                              : Icons.error_sharp,
                      color: Colors.blue[50],
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.booking.status == "available"
                          ? "Disponível"
                          : widget.booking.status == "scheduled"
                              ? "Reservado"
                              : "Ocupado",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
