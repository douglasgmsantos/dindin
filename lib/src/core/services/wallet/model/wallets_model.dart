import 'package:dindin/src/core/services/wallet/model/wallet_model.dart';

class WalletsModel {
  final Map<String, WalletModel> wallets;

  WalletsModel({required this.wallets});

  // Convert WalletsModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'wallets': wallets.map((key, wallet) => MapEntry(key, wallet.toJson())),
    };
  }

  // Create WalletsModel from a JSON map
  factory WalletsModel.fromJson(Map<String, dynamic> json) {
    Map<String, WalletModel> walletsNew = {};
    for (var key in json.keys) {
      walletsNew[key] = WalletModel.fromJson(json[key]);
    }

    return WalletsModel(wallets: walletsNew);
  }
}
