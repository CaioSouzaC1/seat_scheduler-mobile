import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/components/card_store.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository_impl.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final StoreRepository storeRepository = StoreRepositoryImpl();
  List<StoreModel>? _store;

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  Future<void> _fetchStores() async {
    try {
      final result = await storeRepository.fetchStore();
      setState(() {
        _store = result.data;
      });
    } catch (e) {
      rethrow;
    }
  }

  showStore(String id) {
    Navigator.of(context).pushNamed('/show_store', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lojas"),
      ),
      body: ListView(
        children: _store != null
            ? _store!
                .map(
                  (store) => CardStore(
                    store: store,
                    showStore: showStore,
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
