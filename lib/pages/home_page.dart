import 'dart:developer';

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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Email obrigatorio"
                      : null;
                },
              ),
              TextFormField(
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Senha obrigatorio"
                      : null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = formKey.currentState?.validate() ?? false;
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
