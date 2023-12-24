import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/services/authentication/authentication_service.dart';
import 'package:dindin/src/shared/controller/user_controller.dart';

class AppInjections {
  void inject() {
    final injector = DindinInjector.instance;

    // injector.registerSingleton<RestClient>(DioRestClient());
    injector.registerLazySingleton(() => AuthenticationService());
    injector.registerLazySingleton(() => UserController());
  }
}
