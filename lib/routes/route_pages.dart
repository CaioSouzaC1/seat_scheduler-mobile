import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/pages/home_page.dart';

class RoutePages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (args is String) {
        return MaterialPageRoute(builder: (context) => const HomePage());
        }
      default:
        return MaterialPageRoute(builder: (context) => const AuthPage())
    }

        return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
