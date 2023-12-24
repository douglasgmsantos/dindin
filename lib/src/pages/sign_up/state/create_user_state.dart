import 'package:dindin/src/core/state_management/state_management.dart';

class CreateUserInitialState extends DindinInitialState {}

class CreateUserLoadingState extends DindinLoadingState {}

class CreateUserErrorState extends DindinErrorState {
  String message;
  CreateUserErrorState(this.message);
}

class CreateUserSuccessState extends DindinSuccessState {
  CreateUserSuccessState();
}
