import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              "Dados",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text("Nome"),
              trailing: Text("John doe"),
            ),
            ListTile(
              title: Text("Celular"),
              trailing: Text("12312313"),
            ),
            ListTile(
              title: Text("Email"),
              trailing: Text("johndoe@gmail.com"),
            ),
            ListTile(
              title: Text("Criação de conta"),
              trailing: Text("19/08/2024"),
            ),
          ],
        ),
      ),
    );
  }
}

