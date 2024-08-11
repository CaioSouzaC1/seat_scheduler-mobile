import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            "Home page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: const Text("Hello, World", style: TextStyle(fontSize: 30)),
    );
  }
}
