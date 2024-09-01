import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:seat_scheduler_mobile/models/login_model.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';
import 'package:seat_scheduler_mobile/pages/create_account_page.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository.dart';
import 'package:seat_scheduler_mobile/repositories/local_storage_repository_impl.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository_impl.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final LoginRepository loginRepository = LoginRepositoryImpl();
  final LocalStorageRepository localStorageRepository =
      LocalStorageRepositoryImpl();

  LoginModel? loginModel;

  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  setTokenInStorage(String token) {
    localStorageRepository.setTokenInLocalStorage(token);
  }

  moveToHomePage(UserModel user) {
    Navigator.of(context).pushReplacementNamed('/home');
  }

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
                          login: LoginModel(
                              email: emailEC.text, password: passwordEC.text));

                      setState(() {
                        loading = false;
                        setTokenInStorage(result.token as String);
                        moveToHomePage(result.data);

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
                  visible: loading, child: const CircularProgressIndicator()),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountPage()));
                  },
                  child: const Text("Criar conta"))
            ],
          ),
        ),
      ),
    );
  }
}
