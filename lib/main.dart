import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/pages/home_page.dart';
import 'package:seat_scheduler_mobile/routes/route_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool isToken = false;

    if (box.read("token") != null) {
      isToken = true;
    }

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isToken ? const HomePage() : const AuthPage(),
        onGenerateRoute: RoutePages.generateRoute);
  }
}
