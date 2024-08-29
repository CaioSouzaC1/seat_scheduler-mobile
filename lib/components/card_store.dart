import 'package:flutter/material.dart';

class CardStore extends StatefulWidget {
  final Function onTap;
  const CardStore({
    super.key,
    required this.onTap,
  });

  @override
  State<CardStore> createState() => _CardStoreState();
}

class _CardStoreState extends State<CardStore> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://avatarfiles.alphacoders.com/374/374586.png"),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Hello",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Nice'),
          ],
        ),
      ),
    );
  }
}
