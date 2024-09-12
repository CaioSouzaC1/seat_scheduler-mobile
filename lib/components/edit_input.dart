import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    textEC.dispose();
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
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    final valid = formKey.currentState?.validate() ?? false;

                    if (valid) {
                      sendRequest(widget.inputName, textEC.text);
                      Navigator.of(context).pushReplacementNamed(
                        '/home',
                        arguments: 3,
                      );
                      return;
                    }

                    Fluttertoast.showToast(
                        msg: "Tipo de dado invalido",
                        gravity: ToastGravity.TOP,
                        fontSize: 18);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
