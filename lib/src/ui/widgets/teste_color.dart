import 'package:dindin/constants/constants.dart';
import 'package:flutter/material.dart';

class TestColor extends StatelessWidget {
  const TestColor({
    super.key,
    required this.background,
    required this.textColor,
    required this.title,
    required this.outlineColor,
  });
  final Color background;
  final Color textColor;
  final String title;
  final Color outlineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      height: 70,
      padding: const EdgeInsets.all(Constants.paddingPageDefault),
      decoration: BoxDecoration(
        border: Border.all(
          color: outlineColor,
          width: 1,
        ),
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
