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
        padding: EdgeInsets.all(16.0),
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
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email))),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Senha obrigatorio"
                      : null;
                },
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  final valid = formKey.currentState?.validate() ?? false;
                },
                child: const Text("Login"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
