import 'package:dindin/src/core/services/authentication/dto/user_dto.dart';
import 'package:dindin/src/core/services/authentication/firebase_authentication.dart';
import 'package:dindin/src/core/state_management/state_management.dart';
import 'package:dindin/src/pages/sign_up/state/create_user_state.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  final ValueNotifier nameState =
      ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier emailState =
      ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier passwordState =
      ValueNotifier<TextEditingController>(TextEditingController());

  ValueNotifier createUserState =
      ValueNotifier<DindinState>(CreateUserInitialState());

  SignUpController();

  Future createUser() async {
    try {
      createUserState.value = CreateUserLoadingState();
      String name = nameState.value.text;
      String email = emailState.value.text;
      String password = passwordState.value.text;

      var user = UserEntity(name: name, email: email, password: password);
      var response =
          await _authentication.createUserWithEmailAndPassword(user: user);

      if (response.$2 != null) {
        createUserState.value = CreateUserErrorState(
          response.$2!,
        );
        return;
      }

      createUserState.value = CreateUserSuccessState();
    } on Exception {
      createUserState.value = CreateUserErrorState(
        "Ocorreu um erro no cadastro do usuário.",
      );
    }
  }
}
