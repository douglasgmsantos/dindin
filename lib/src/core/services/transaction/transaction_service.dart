import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dindin/src/core/services/transaction/model/transactions_model.dart';
import 'package:dindin/src/core/services/transaction/respositories/transaction_repository.dart';

class TransactionService implements TransactionRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<TransactionsModel> getTransactions({
    required String uid,
  }) async {
    final response = await _firebaseFirestore
        .collection(uid)
        .doc("transactions")
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

    return TransactionsModel.fromJson(response);
  }

  @override
  Future<bool> removeTransaction({
    required String uidUser,
    required String uidTransaction,
  }) async {
    return true;
  }
}
