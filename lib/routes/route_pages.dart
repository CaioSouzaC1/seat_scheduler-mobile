import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/global/main_screen.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/pages/create_account_page.dart';
import 'package:seat_scheduler_mobile/pages/home_page.dart';
import 'package:seat_scheduler_mobile/pages/show_booking_page.dart';
import 'package:seat_scheduler_mobile/pages/store_page.dart';

import '../pages/perfil_page.dart';
import '../pages/show_store_page.dart';

class RoutePages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case "/create_accout":
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      case "/perfil":
        return MaterialPageRoute(builder: (_) => const PerfilPage());
      case "/store":
        return MaterialPageRoute(builder: (_) => const StorePage());
      case "/show_store":
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ShowStorePage(storeId: args));
        }
      case "/show_booking":
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ShowBookingPage(bookingId: args));
        }
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
