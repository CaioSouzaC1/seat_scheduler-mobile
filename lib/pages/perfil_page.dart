import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/components/avatar_user.dart';
import 'package:seat_scheduler_mobile/models/user_model.dart';
import 'package:seat_scheduler_mobile/utils/format_date.dart';

import '../repositories/user_repository.dart';
import '../repositories/user_repository.impl.dart';

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
      rethrow;
    }
  }

  moveToEditPage(String inputName) {
    Navigator.of(context)
        .pushNamed('/edit_input', arguments: inputName)
        .then((_) async {
      setState(() {});
    });
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
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(213, 0, 0, 1),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: AvatarUser(
              imagePath: "",
              onPressed: () {},
            ),
          ),
          _user != null
              ? buildUserInfoDisplay(_user!.name, "Name")
              : const CircularProgressIndicator(),
          _user != null
              ? buildUserInfoDisplay(_user!.phone, "Phone")
              : const CircularProgressIndicator(),
          _user != null
              ? buildUserInfoDisplay(_user!.email, "Email")
              : const CircularProgressIndicator(),
          _user != null
              ? buildUserInfoDisplay(_formatDate!, "Created at")
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              width: 350,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        moveToEditPage(title.toLowerCase());
                      },
                      child: Text(
                        getValue,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
