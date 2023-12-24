class WalletModel {
  final String uid;
  final bool active;
  final String name;
  final double balance;
  final double income;
  final double outcome;
  final List<String> transactions;

  WalletModel({
    required this.uid,
    required this.active,
    required this.name,
    required this.balance,
    required this.income,
    required this.outcome,
    required this.transactions,
  });

  // Convert WalletModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'active': active,
      'name': name,
      'balance': balance,
      'income': income,
      'outcome': outcome,
      'transactions': transactions,
    };
  }

  // Create WalletModel from a JSON map
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      uid: json['uid'] as String,
      active: json['active'] as bool,
      name: json['name'] as String,
      balance: double.parse(json['balance'].toString()),
      income: double.parse(json['income'].toString()),
      outcome: double.parse(json['outcome'].toString()),
      transactions: json['transactions'].cast<String>(),
    );
  }
}
