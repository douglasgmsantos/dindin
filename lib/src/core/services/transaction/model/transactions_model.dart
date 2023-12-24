import 'package:dindin/src/core/services/transaction/model/transaction_model.dart';

class TransactionsModel {
  final Map<String, TransactionModel> transactions;

  TransactionsModel({
    required this.transactions,
  });

  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions.map(
        (key, transactions) => MapEntry(
          key,
          transactions.toJson(),
        ),
      ),
    };
  }

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    Map<String, TransactionModel> transactionsNew = {};
    for (var key in json.keys) {
      transactionsNew[key] = TransactionModel.fromJson(json[key]);
    }

    return TransactionsModel(transactions: transactionsNew);
  }
}
