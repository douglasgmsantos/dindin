import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/services/authentication/authentication_service.dart';
import 'package:dindin/src/shared/user/controller/user_controller.dart';

class SplashController {
  final UserController userController = DindinInjector.I.get<UserController>();
  final AuthenticationService authenticationService =
      DindinInjector.I.get<AuthenticationService>();

  setUser({
    required String uid,
  }) async {
    final user = await authenticationService.getUser(uid: uid);
    userController.setUser(user);
  }
}
