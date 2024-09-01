import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/store_model.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

class CardStore extends StatefulWidget {
  final StoreModel store;
  const CardStore({super.key, required this.store});

  @override
  State<CardStore> createState() => _CardStoreState();
}

class _CardStoreState extends State<CardStore> {
  final imageGeneric = "https://avatarfiles.alphacoders.com/374/374586.png";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              formatUrlLocalApiImage(widget.store.attachments?[0].imagePath) ??
                  imageGeneric,
              errorBuilder: (context, error, StackTrace) {
                print('error');
                print(error);
                return Text("Error");
              },
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.store.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.store.description ?? "",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
