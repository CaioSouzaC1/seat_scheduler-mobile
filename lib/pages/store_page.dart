import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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

  final PagingController<int, StoreModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  Future<void> _fetchStores() async {
    try {
      final result = await storeRepository.fetchStore();
      try {
        if (result.meta.lastPage < 20) {
          setState(() {
            _store = result.data;
            _pagingController.appendLastPage(_store!);
          });
        } else {
          setState(() {
            _store = result.data;
            _pagingController.appendPage(_store!, result.meta.perPage);
          });
        }
      } catch (e) {
        _pagingController.error = e;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  showStore(String id) {
    Navigator.of(context).pushNamed('/show_store', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, StoreModel>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<StoreModel>(
        itemBuilder: (context, item, index) => CardStore(
          store: item,
          showStore: showStore,
        ),
      ),
    );

    //return Scaffold(
    //  appBar: AppBar(
    //    title: const Center(
    //      child: Text(
    //        "Lojas",
    //        style: TextStyle(
    //          color: Colors.white,
    //          fontSize: 30,
    //          fontWeight: FontWeight.bold,
    //        ),
    //      ),
    //    ),
    //  ),
    //  body: ListView(
    //    children: _store != null
    //        ? _store!
    //            .map(
    //              (store) => CardStore(
    //                store: store,
    //                showStore: showStore,
    //              ),
    //            )
    //            .toList()
    //        : [
    //            const Center(
    //              child: CircularProgressIndicator(),
    //            ),
    //          ],
    //  ),
    //);
  }
}
