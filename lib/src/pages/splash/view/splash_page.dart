import 'package:dindin/constants/constants.dart';
import 'package:dindin/src/pages/splash/controller/splash_controller.dart';
import 'package:dindin/src/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _authFirebaseDataSource = FirebaseAuth.instance;
  final SplashController splashController = SplashController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authFirebaseDataSource.authStateChanges().listen(
        (User? user) async {
          if (user == null) {
            Navigator.of(context).pushNamed(AppPages.signInRouter.id);
          } else {
            await splashController.setUser(uid: user.uid);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed(AppPages.baseRouter.id);
          }
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Constants.uriLogoElementWithoutBackground,
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
