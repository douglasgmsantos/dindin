import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dindin/src/core/errors/failure.dart';
import 'package:dindin/src/core/services/authentication/dto/user_dto.dart';
import 'package:dindin/src/core/services/authentication/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication implements AuthenticationRepository {
  final FirebaseAuth _authFirebaseDataSource = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuthentication();

  @override
  Future<(UserEntity?, String?)> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authFirebaseDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.credential != null) {
        throw Failure("Não foi possível realizar a autenticação!");
      }

      final user = await _firebaseFirestore
          .collection(response.user!.uid)
          .doc("user")
          .get()
          .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

      return (UserEntity.fromJson(user), null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return (null, 'Usuário ou senha não encontrado, tente novamente!');
      } else if (e.code == 'wrong-password') {
        return (null, 'Usuário ou senha não encontrado, tente novamente!');
      } else {
        return (null, 'Ocorreu um erro ao tentar logar, tente novamente!');
      }
    } on Failure catch (e) {
      return (null, e.message);
    } catch (e) {
      return (null, 'Ocorreu um erro ao tentar logar, tente novamente!');
    }
  }

  @override
  Future<(bool, String?)> createUserWithEmailAndPassword({
    required UserEntity user,
  }) async {
    bool result = false;
    String? message;

    try {
      final response =
          await _authFirebaseDataSource.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      if (response.user == null) {
        throw Failure("Não foi possível realizar a autenticação!");
      }

      final userEntity = UserEntity(
        uid: response.user?.uid,
        name: user.name,
        email: response.user?.email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firebaseFirestore
          .collection(response.user!.uid)
          .doc("user")
          .set(userEntity.toMap());

      result = true;
    } on Failure catch (error) {
      message = error.message;
    } on FirebaseAuthException catch (error) {
      const errors = {
        "email-already-in-use": "Esse e-mail já está sendo utilizado.",
        "invalid-email": "E-mail incorreto.",
        "operation-not-allowed": "Essa operação nãoi foi permitida no momento.",
        "weak-password":
            "Essa senha é fraca, tenta adicionar uma senha mais forte."
      };
      message = errors[error.code] ?? error.message;
    }

    return (result, message);
  }

  @override
  Future<void> logout() {
    return _authFirebaseDataSource.signOut();
  }
}
