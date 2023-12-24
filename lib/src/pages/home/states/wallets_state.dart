import 'package:dindin/src/core/services/wallet/model/wallet_model.dart';
import 'package:dindin/src/core/state_management/state_management.dart';

class WalletsInitialState extends DindinInitialState {}

class WalletsLoadingState extends DindinLoadingState {}

class WalletsErrorState extends DindinErrorState {}

class WalletsSuccessState extends DindinSuccessState {
  List<WalletModel> wallets;
  WalletsSuccessState(this.wallets);
}
