import 'package:dindin/src/core/core.dart';
import 'package:flutter/material.dart';

class ButtonCreateUser extends StatelessWidget {
  const ButtonCreateUser({
    super.key,
    this.isLoading = false,

    //Obrigatórios
    required this.onPressed,
  });

  final void Function()? onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.maxFinite,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            darkColorScheme.primary,
          ),
        ),
        onPressed: onPressed,
        child: isLoading == true
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(
                "Salvar",
                style: TextStyle(
                  color: darkColorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
