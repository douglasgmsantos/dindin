import 'package:dindin/src/core/services/transaction/transaction_service.dart';
import 'package:dindin/src/core/services/wallet/model/wallet_model.dart';
import 'package:dindin/src/core/services/wallet/wallet_service.dart';
import 'package:dindin/src/core/state_management/state_management.dart';
import 'package:dindin/src/pages/home/states/wallets_state.dart';
import 'package:dindin/src/shared/transaction/states/delete_transaction_state.dart';
import 'package:dindin/src/shared/transaction/states/transactions_state.dart';
import 'package:dindin/src/shared/user/controller/user_controller.dart';
import 'package:flutter/material.dart';

class HomeController {
  final UserController userController;
  final WalletService walletService;
  final TransactionService transactionService;

  HomeController({
    required this.userController,
    required this.walletService,
    required this.transactionService,
  }) {
    uid = userController.getUser()!.uid;
  }

  late String uid;

  ValueNotifier<WalletModel?> walletSelectedState =
      ValueNotifier<WalletModel?>(null);

  ValueNotifier walletsState =
      ValueNotifier<DindinState>(WalletsInitialState());

  ValueNotifier transactionsState =
      ValueNotifier<DindinState>(TransactionLoadingState());

  ValueNotifier deleteTransactionState =
      ValueNotifier<DindinState>(DeleteTransactionInitialState());

  init() async {
    Future.wait([
      getTransactions(),
      getWallets(),
    ]).then((value) {
      if (walletsState.value is WalletsSuccessState) {
        final wallet = (walletsState.value as WalletsSuccessState)
            .wallets
            .where((wallet) => wallet.active)
            .firstOrNull;

        walletSelectedState.value = wallet;
      }
    });
  }

  void changeWallet(WalletModel newWallet) {
    walletSelectedState.value = newWallet;
  }

  Future getWallets() async {
    try {
      walletsState.value = WalletsLoadingState();
      final result = await walletService.getWallets(uid: uid);
      final wallets =
          result.wallets.keys.map((key) => result.wallets[key]!).toList();

      walletsState.value = WalletsSuccessState(wallets);
    } on Exception catch (_) {
      walletsState.value = WalletsErrorState();
    }
  }

  Future getTransactions() async {
    try {
      transactionsState.value = TransactionLoadingState();
      final result = await transactionService.getTransactions(uid: uid);
      final transactions = result.transactions.keys
          .map((key) => result.transactions[key]!)
          .toList();

      transactionsState.value = TransactionSuccessState(transactions);
    } on Exception catch (_) {
      transactionsState.value =
          TransactionErrorState("Ocorreu um erro para listar as movimentações");
    }
  }

  Future deleteTransaction({required String uidTransaction}) async {
    try {
      deleteTransactionState.value = DeleteTransactionLoadingState();
      final response = await transactionService.removeTransaction(
        uidUser: uid,
        uidTransaction: uidTransaction,
      );

      if (!response) {
        throw Exception("Ocorreu um erro ao tentar deletar a movimentação.");
      }

      deleteTransactionState.value = DeleteTransactionSuccessState();
      final transactionsNew =
          (transactionsState.value as TransactionSuccessState)
              .transactions
              .where(
                (transaction) => transaction.uid != uidTransaction,
              )
              .toList();

      transactionsState.value = TransactionSuccessState(transactionsNew);
    } catch (_) {
      deleteTransactionState.value = DeleteTransactionErrorState(
        "Ocorreu um erro ao tentar deletar a movimentação.",
      );
    }
  }
}
