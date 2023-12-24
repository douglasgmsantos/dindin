import 'package:dindin/src/core/services/authentication/dto/create_user_dto.dart';
import 'package:dindin/src/core/services/authentication/dto/user.dart';

abstract class AuthenticationRepository {
  Future<(User?, String?)> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<(bool, String?)> createUserWithEmailAndPassword({
    required CreateUserDTO createUserDTO,
  });
  Future<void> logout();
}
