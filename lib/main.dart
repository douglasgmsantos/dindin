import 'package:dindin/src/core/core.dart';
import 'package:dindin/src/routes/routes.dart';
import 'package:dindin/src/pages/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialRoute: AppPages.splashRouter.route,
      getPages: AppPages.pages,
    );
  }
}
