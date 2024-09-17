import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository_impl.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

import '../repositories/store_repository.dart';

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
  StoreModel? _store;

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
                  child: Image.network(formatUrlLocalApiImage(
                      _store!.attachments![0].imagePath)),
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
                      _store!.address != null
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
                            "6:00PM - 2:00PM",
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
          ],
        ),
      ),
    );
  }
}
