import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
              child: Text(
            'Fazer Login',
            style: TextStyle(color: Colors.white),
          ))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: emailEC,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? "Email obrigatorio"
                        : null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email))),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Senha obrigatorio"
                      : null;
                },
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  final valid = formKey.currentState?.validate() ?? false;
                  if (valid) {
                    try {
                      setState(() {
                        loading = true;
                      });
                      final result = await loginRepository.makeLogin(
                          emailEC.text, passwordEC.text);
                      setState(() {
                        loading = false;
                        Fluttertoast.showToast(
                            msg: "Logado",
                            gravity: ToastGravity.TOP,
                            fontSize: 18);
                      });
                    } catch (e) {
                      setState(() {
                        loading = false;
                      });
                      Fluttertoast.showToast(
                          msg: "Email ou senha invalida",
                          gravity: ToastGravity.TOP,
                          fontSize: 18);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                child: const Text("Login"),
              ),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
