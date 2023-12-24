import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/services/authentication/authentication_service.dart';
import 'package:dindin/src/core/services/transaction/transaction_service.dart';
import 'package:dindin/src/core/services/wallet/wallet_service.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/shared/user/controller/user_controller.dart';

class AppInjections {
  void inject() {
    final injector = DindinInjector.instance;

    // injector.registerSingleton<RestClient>(DioRestClient());
    injector.registerLazySingleton(() => AuthenticationService());
    injector.registerLazySingleton(() => WalletService());
    injector.registerLazySingleton(() => TransactionService());

    injector.registerLazySingleton(() => UserController());

    injector.registerLazySingleton(
      () => HomeController(
        transactionService: DindinInjector.I.retrive<TransactionService>(),
        walletService: DindinInjector.I.retrive<WalletService>(),
        userController: DindinInjector.I.retrive<UserController>(),
      ),
    );
  }
}
