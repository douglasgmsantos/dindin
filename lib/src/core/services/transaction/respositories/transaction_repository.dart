import 'package:dindin/src/core/services/transaction/model/transactions_model.dart';

abstract class TransactionRepository {
  Future<TransactionsModel> getTransactions({
    required String uid,
  });
  Future<bool> removeTransaction({
    required String uidUser,
    required String uidTransaction,
  });
}
