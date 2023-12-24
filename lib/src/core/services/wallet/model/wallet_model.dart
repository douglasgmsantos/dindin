import 'package:dindin/src/core/services/wallet/model/transaction_model.dart';

class WalletModel {
  final double balance;
  final double income;
  final double outcome;
  final List<TransactionModel> transactions;

  WalletModel({
    required this.balance,
    required this.income,
    required this.outcome,
    required this.transactions,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      balance: json['balance'] ?? 0,
      income: json['income'] ?? 0,
      outcome: json['outcome'] ?? 0,
      transactions: (json['transactions'] as List)
          .map(
            (transactionsJson) => TransactionModel.fromJson(transactionsJson),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'income': income,
      'outcome': outcome,
      'transactions': transactions
          .map((transaction) => transaction.toJson())
          .toList(), // Map transactions to their JSON representations
    };
  }
}
