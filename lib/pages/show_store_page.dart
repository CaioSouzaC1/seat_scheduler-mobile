import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository_impl.dart';

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
      body: Center(
        child: _store != null
            ? Text(_store!.name)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
