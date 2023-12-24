import 'package:dindin/src/core/services/authentication/firebase_authentication.dart';
import 'package:dindin/src/core/state_management/state_management.dart';
import 'package:dindin/src/pages/sign_in/state/user_state.dart';
import 'package:flutter/material.dart';

class SignInController {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  ValueNotifier userState = ValueNotifier<DindinState>(UserInitialState());

  SignInController();

  Future authenticate({
    required String email,
    required String password,
  }) async {
    userState.value = UserLoadingState();
    var response = await _authentication.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (response.$2 != null) {
      userState.value = UserErrorState(response.$2!);
      return;
    }

    if (response.$1 != null) {
      userState.value = UserSuccessState(response.$1!);
    }
  }
}
