import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserGetData implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  UserGetData(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.getUserCurrentData();
  }
}
