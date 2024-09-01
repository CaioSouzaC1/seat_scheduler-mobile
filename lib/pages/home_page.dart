import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalStorageRepository localStorageRepository =
      LocalStorageRepositoryImpl();

  moveToStore() {
    Navigator.of(context).pushNamed(
      '/store',
    );
  }

  signOut() {
    localStorageRepository.deleteTokenFromLocalStorage();
    Navigator.of(context).pushReplacementNamed('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: const Icon(Icons.logout))
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
