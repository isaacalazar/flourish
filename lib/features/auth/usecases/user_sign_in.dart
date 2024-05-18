import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await authRepository.signInWithEmail(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;
  UserSignInParams(this.email, this.password);
}
