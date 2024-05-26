import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final user = await authRemoteDataSource.signInWithEmail(
          email: email, password: password);

      return right(user);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmail(
          email: email, name: username, password: password);

      return right(user);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }

  @override
  Future<Either<Failure, User>> getUserCurrentData() async {
    try {
      final userData = await authRemoteDataSource.getUserCurrentData();

      if (userData == null) {
        return left(Failure("User not found"));
      }

      return right(userData);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return right(await authRemoteDataSource.signOut());
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }
}
