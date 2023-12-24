import 'package:dindin/src/core/services/transaction/model/transaction_model.dart';
import 'package:dindin/src/core/state_management/state_management.dart';

class TransactionInitialState extends DindinInitialState {}

class TransactionLoadingState extends DindinLoadingState {}

class TransactionErrorState extends DindinErrorState {
  String message;
  TransactionErrorState(this.message);
}

class TransactionSuccessState extends DindinSuccessState {
  List<TransactionModel> transactions;
  TransactionSuccessState(this.transactions);
}
