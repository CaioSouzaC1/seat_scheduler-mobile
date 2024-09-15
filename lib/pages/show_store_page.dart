import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/repositories/store_repository_impl.dart';

import '../components/avatar_user.dart';
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
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _store != null
                  ? Text(
                      _store!.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(213, 0, 0, 1),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          InkWell(
            onTap: () {
              print('nice');
            },
            child: AvatarUser(
              imagePath: _store != null && _store!.attachments != null
                  ? _store!.attachments![0].imagePath
                  : "",
              onPressed: () {},
            ),
          ),
          _store != null
              ? buildUserInfoDisplay(_store!.phone, "Phone")
              : const CircularProgressIndicator(),
          _store != null
              ? buildUserInfoDisplay(_store!.address!.street, "Adress")
              : const CircularProgressIndicator(),
          _store != null
              ? buildUserInfoDisplay(_store!.address!.number, "Number")
              : const CircularProgressIndicator(),
          _store != null
              ? buildUserInfoDisplay(_store!.address!.cep, "CEP")
              : const CircularProgressIndicator(),
          _store != null
              ? buildUserInfoDisplay(
                  _store!.address!.neighborhood, "Neighborhood")
              : const CircularProgressIndicator(),
          _store != null && _store!.address!.complement != null
              ? buildUserInfoDisplay(_store!.address!.complement, "Complement")
              : const SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(dynamic getValue, String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              width: 350,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        //moveToEditPage(title.toLowerCase());
                        print('print');
                      },
                      child: Text(
                        getValue.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
