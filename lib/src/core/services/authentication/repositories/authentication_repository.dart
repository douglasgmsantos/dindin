import 'package:dindin/src/core/services/authentication/dto/user_dto.dart';

abstract class AuthenticationRepository {
  Future<(UserEntity?, String?)> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<(bool, String?)> createUserWithEmailAndPassword({
    required UserEntity user,
  });
  Future<void> logout();
}
