import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';
import 'package:seat_scheduler_mobile/repositories/user_repository_impl.dart';
import 'package:seat_scheduler_mobile/utils/format_date.dart';

import '../repositories/user_repository.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final UserRepository userRepository = UserRepositoryImpl();
  UserModel? _user;
  String? _formatDate;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      final resultData = await userRepository.getMe();
      setState(() {
        _user = resultData.data;
        _formatDate = formatDate(_user!.createdAt);
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil page"),
      ),
      body: Center(
        child: _user == null
            ? const CircularProgressIndicator()
            : Column(
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
                    trailing: Text(
                      _user!.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Celular"),
                    trailing: Text(
                      _user!.phone,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Email"),
                    trailing: Text(
                      _user!.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Criação de conta"),
                    trailing: Text(
                      _formatDate!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
