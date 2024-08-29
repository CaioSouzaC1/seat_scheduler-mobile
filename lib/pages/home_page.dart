import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  moveToStore() {
    Navigator.of(context).pushNamed(
      '/store',
    );
  }

  moveToPerfil() {
    Navigator.of(context).pushNamed('/perfil');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        actions: [
          IconButton(
              onPressed: () {
                moveToPerfil();
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    moveToStore();
                  },
                  child: const Text("Lojas"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
