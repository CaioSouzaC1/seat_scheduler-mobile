import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/repositories/user_repository_impl.dart';

import '../repositories/user_repository.dart';

class EditPage extends StatefulWidget {
  final String inputName;
  const EditPage({
    super.key,
    required this.inputName,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final UserRepository userRepository = UserRepositoryImpl();
  final formKey = GlobalKey<FormState>();
  final textEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  sendRequest(String name, String value) async {
    await userRepository.update(name, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: TextFormField(
                    controller: textEC,
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? "Campo esta vazio"
                          : null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.input),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sendRequest(widget.inputName, textEC.text);
                        Navigator.pop(context, true);
                      },
                      child: const Text("Send"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
