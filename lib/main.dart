import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seat_scheduler_mobile/global/main_screen.dart';
import 'package:seat_scheduler_mobile/pages/auth_page.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository.dart';
import 'package:seat_scheduler_mobile/repositories/login_repository_impl.dart';
import 'package:seat_scheduler_mobile/routes/route_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final box = GetStorage.init();
  bool isToken = false;
  final LoginRepository loginRepository = LoginRepositoryImpl();

  @override
  void initState() {
    super.initState();
    validateToken();
  }

  Future<void> validateToken() async {
    isToken = await loginRepository.checkValidateToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(23, 23, 23, 1),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
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
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[50]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[50]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[50]!, width: 2.0),
            ),
            labelStyle: TextStyle(color: Colors.blue[50]!),
            hintStyle: TextStyle(color: Colors.blue[50]!.withOpacity(0.6)),
          ),
          useMaterial3: true,
        ),
        home: isToken ? const MainScreen(selectIndex: 0) : const AuthPage(),
        onGenerateRoute: RoutePages.generateRoute);
  }
}
