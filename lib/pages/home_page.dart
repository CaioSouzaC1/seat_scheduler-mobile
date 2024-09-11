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

  signOut() {
    localStorageRepository.deleteTokenFromLocalStorage();
    Navigator.of(context).pushReplacementNamed('/auth');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página inicial"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'A Procura de uma mesa especial?',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.white.withOpacity(0.2),
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/imgs/table1.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover, 
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
