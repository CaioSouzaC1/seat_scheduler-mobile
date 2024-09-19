import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:seat_scheduler_mobile/models/booking_model.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/bookings_repository.dart';
import 'package:seat_scheduler_mobile/repositories/bookings_repository.impl.dart';
import 'package:seat_scheduler_mobile/utils/format_date.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

import '../repositories/store_repository.dart';
import '../repositories/store_repository.impl.dart';

class ShowStorePage extends StatefulWidget {
  final String storeId;

  const ShowStorePage({
    super.key,
    required this.storeId,
  });

  @override
  State<ShowStorePage> createState() => _ShowStorePageState();
}

class _ShowStorePageState extends State<ShowStorePage> {
  final StoreRepository storeRepository = StoreRepositoryImpl();
  final BookingsRepository bookingsRepository = BookingsRepositoryImpl();
  StoreModel? _store;
  String? _selectItem;
  String? _tableId;

  @override
  void initState() {
    super.initState();
    getStore();
  }

  Future<void> getStore() async {
    final result = await storeRepository.getStore(widget.storeId);
    setState(() {
      _store = result.data;
    });
  }

  void registerBooking() async {
    if (_tableId != null) {
      await bookingsRepository.resgiterBooking(
        booking: BookingRequest(
            tableId: _tableId!,
            reservedDate: formatDate(DateTime.now().toString()),
            storeId: _store!.id),
      );

      Fluttertoast.showToast(
          msg: "Await for answer the store",
          gravity: ToastGravity.TOP,
          fontSize: 18);
      return;
    }

    Fluttertoast.showToast(
        msg: "Choose a table", gravity: ToastGravity.TOP, fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.2,
                  child: (_store != null && _store!.attachments != null)
                      ? Image.network(formatUrlLocalApiImage(
                          _store!.attachments![0].imagePath))
                      : const CircularProgressIndicator(),
                ),
                Positioned(
                  top: 30,
                  child: _store != null
                      ? Text(
                          _store!.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(213, 0, 0, 1),
                            fontSize: 30,
                          ),
                        )
                      : const Text(""),
                ),
                Positioned(
                  top: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      (_store != null && _store!.address != null)
                          ? Text(
                              _store!.address!.street,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(213, 0, 0, 1),
                                fontSize: 16,
                              ),
                            )
                          : const Text(""),
                    ],
                  ),
                ),
                Positioned(
                  child: (_store != null && _store!.evaluaion != null)
                      ? Text(
                          "(${_store!.evaluaion!.note}/10)",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(213, 0, 0, 1),
                            fontSize: 16,
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
                Positioned(
                  bottom: 70,
                  child: Row(
                    children: [
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.watch_later,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "18:00 - 02:00",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(213, 0, 0, 1),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          _store != null
                              ? Text(
                                  _store!.phone,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(213, 0, 0, 1),
                                    fontSize: 16,
                                  ),
                                )
                              : const CircularProgressIndicator()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(213, 0, 0, 1),
                fontSize: 30,
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: (_store != null && _store!.menu != null)
                  ? _store!.menu!
                      .map(
                        (menu) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.dining_outlined,
                                  color: Color.fromRGBO(213, 0, 0, 1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  menu.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  menu.price.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Icon(
                                  Icons.attach_money,
                                  color: Color.fromRGBO(213, 0, 0, 1),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                      .toList()
                  : [const CircularProgressIndicator()],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Escolha uma mesa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                (_store != null && _store!.table != null)
                    ? DropdownButton(
                        hint: _selectItem == null
                            ? const Text(
                                "Número  das mesas",
                                style: TextStyle(color: Colors.white),
                              )
                            : Text(
                                _selectItem!,
                                style: const TextStyle(color: Colors.white),
                              ),
                        items: _store!.table
                            ?.map(
                              (table) => DropdownMenuItem(
                                value: table,
                                child: Text(table.number.toString()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectItem = value!.number.toString();
                            _tableId = value.id;
                          });
                        },
                      )
                    : const DropdownMenuItem(
                        value: 0,
                        child: Text("Nenhuma mesa encontrada"),
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onPressed: () {
                registerBooking();
              },
              child: const Text("Agendar"),
            ),
          ],
        ),
      ),
    );
  }
}
