import 'package:dindin/src/core/state_management/state_management.dart';

class UserInitialState extends DindinInitialState {}

class UserLoadingState extends DindinLoadingState {}

class UserErrorState extends DindinErrorState {
  String message;

  UserErrorState(this.message);
}

class UserSuccessState extends DindinSuccessState {
  UserSuccessState();
}
