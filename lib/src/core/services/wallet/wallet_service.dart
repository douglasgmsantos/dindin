import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dindin/src/core/services/wallet/model/wallets_model.dart';
import 'package:dindin/src/core/services/wallet/respositories/wallet_repository.dart';

class WalletService implements WalletRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<WalletsModel> getWallets({
    required String uid,
  }) async {
    final response = await _firebaseFirestore
        .collection(uid)
        .doc("wallets")
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

    return WalletsModel.fromJson(response);
  }

  @override
  Future<bool> removeTransaction({
    required String uidWallet,
    required String uidTransaction,
  }) async {
    return true;
  }
}
