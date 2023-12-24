import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/services/authentication/authentication_service.dart';
import 'package:dindin/src/core/state_management/state_management.dart';
import 'package:dindin/src/pages/sign_in/state/user_state.dart';
import 'package:dindin/src/shared/user/controller/user_controller.dart';
import 'package:flutter/material.dart';

class SignInController {
  final _authentication = DindinInjector.I.get<AuthenticationService>();
  final _userController = DindinInjector.I.get<UserController>();

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
      _userController.setUser(response.$1!);
      userState.value = UserSuccessState();
    }
  }
}
