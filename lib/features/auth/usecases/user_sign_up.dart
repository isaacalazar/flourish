import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmail(
        username: params.username,
        email: params.email,
        password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String username;

  UserSignUpParams(this.email, this.password, this.username);
}
