import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> getUserCurrentData();

  Future<Either<Failure, void>> signOut();
}
