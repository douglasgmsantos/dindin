import 'package:dindin/src/core/state_management/state_management.dart';

class DeleteTransactionInitialState extends DindinInitialState {}

class DeleteTransactionLoadingState extends DindinLoadingState {}

class DeleteTransactionErrorState extends DindinErrorState {
  String message;
  DeleteTransactionErrorState(this.message);
}

class DeleteTransactionSuccessState extends DindinSuccessState {}
