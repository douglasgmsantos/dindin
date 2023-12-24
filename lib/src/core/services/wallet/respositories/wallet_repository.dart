import 'package:dindin/src/core/services/wallet/model/wallets_model.dart';

abstract class WalletRepository {
  Future<WalletsModel> getWallets({
    required String uid,
  });
  Future<bool> removeTransaction({
    required String uidWallet,
    required String uidTransaction,
  });
}
