import 'package:dindin/src/core/services/authentication/model/create_user.dart';
import 'package:dindin/src/core/services/authentication/model/user.dart';

abstract class AuthenticationRepository {
  Future<(User?, String?)> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<(bool, String?)> createUserWithEmailAndPassword({
    required CreateUser createUser,
  });
  Future<void> logout();
}
