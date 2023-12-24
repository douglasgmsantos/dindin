import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:dindin/src/core/core.dart';
import 'package:dindin/src/routes/routes.dart';
import 'package:dindin/src/pages/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialRoute: AppPages.splashRouter.route,
      onGenerateRoute: AppPages.onGenerateRoute,
    );
  }
}
