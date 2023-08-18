import 'package:dindin/constants/constants.dart';
import 'package:flutter/material.dart';

class SplashComponent extends StatefulWidget {
  const SplashComponent({super.key});

  @override
  State<SplashComponent> createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/home'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.black),
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
