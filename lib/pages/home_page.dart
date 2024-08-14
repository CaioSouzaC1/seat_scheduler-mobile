import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Text("Hello " + widget.user.name)
      body: (Container(
        child: const Text(),
      )),
    );
  }
}
