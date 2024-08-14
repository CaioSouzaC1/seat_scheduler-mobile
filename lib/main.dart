import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/routes/route_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthPage(),
        onGenerateRoute: RoutePages.generateRoute);
  }
}
