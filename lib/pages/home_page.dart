import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/login_model.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginRepository loginRepository = LoginRepositoryImpl();
  LoginModel? loginModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              TextFormField(),
              ElevatedButton(onPressed: () {}, child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
