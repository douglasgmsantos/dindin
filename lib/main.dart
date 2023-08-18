import 'package:dindin/src/core/core.dart';
import 'package:dindin/src/pages/auth/sign_in_page.dart';
import 'package:dindin/src/pages/home/home_page.dart';
import 'package:dindin/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: darkColorScheme,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/home":
              return MaterialPageRoute(builder: (_) => const HomePage());
            case "/signin":
              return MaterialPageRoute(builder: (_) => const SignInPage());
          }
          return null;
        });
  }
}
