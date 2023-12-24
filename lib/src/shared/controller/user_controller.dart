import 'package:dindin/src/core/services/authentication/dto/user.dart';
import 'package:flutter/material.dart';

class UserController {
  final ValueNotifier<User?> _userState = ValueNotifier<User?>(null);

  User? getUser() {
    return _userState.value;
  }

  setUser(User user) {
    _userState.value = user;
  }
}
