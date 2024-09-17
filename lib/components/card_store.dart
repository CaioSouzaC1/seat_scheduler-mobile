import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

class CardStore extends StatefulWidget {
  final StoreModel store;
  final Function showStore;

  const CardStore({
    super.key,
    required this.store,
    required this.showStore,
  });

  @override
  State<CardStore> createState() => _CardStoreState();
}

class _CardStoreState extends State<CardStore> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.showStore(widget.store.id);
      },
      child: Card(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: NetworkImage(
                    formatUrlLocalApiImage(widget.store.attachments != []
                        ? widget.store.attachments![0].imagePath
                        : ""),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.store.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.store.description ?? "",
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Evaluation",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.store.evaluaion != null
                          ? "${widget.store.evaluaion!.note}/10"
                          : "3/10",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
