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
  StoreModel? _store;

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  Future<void> _fetchStores() async {
    try {
      final result = await storeRepository.fetchStore();
      print(result);
    } catch (e) {
      rethrow;
    }
  }

  void _moveToStoreShow(String storeId) {
    // Navigator.of(context).pushNamed('/store', arguments: storeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lojas"),
      ),
      body: ListView(
        children: [
          CardStore(onTap: _moveToStoreShow),
        ],
      ),
    );
  }
}
