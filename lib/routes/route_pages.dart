import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/pages/create_account_page.dart';
import 'package:seat_scheduler_mobile/pages/home_page.dart';

class RoutePages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case "/create_accout":
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
    }

    return MaterialPageRoute(builder: (context) => const Error());
  }
}

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela não encontrada"),
      ),
      body: const Center(
        child: Text("Tela não encontrada"),
      ),
    );
  }
}
