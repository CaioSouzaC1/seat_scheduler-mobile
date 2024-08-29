import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seat_scheduler_mobile/global/main_screen.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
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
          scaffoldBackgroundColor: Color.fromRGBO(23, 23, 23, 1),
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromRGBO(23, 23, 23, 1),
            titleTextStyle: TextStyle(
              color: Colors.blue[50],
            ),
            iconTheme: IconThemeData(
              color: Colors.blue[50],
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              color: Colors.blue[50],
            ),
            bodyMedium: TextStyle(
              color: Colors.blue[50],
            ),
            bodySmall: TextStyle(
              color: Colors.blue[50],
            ),
          ),
          useMaterial3: true,
        ),
        
        home: isToken ? const MainScreen() : const AuthPage(),
        onGenerateRoute: RoutePages.generateRoute);
  }
}
