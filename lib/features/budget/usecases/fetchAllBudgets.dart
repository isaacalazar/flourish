import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';

class FetchAllBudgets implements UseCase<List<Budget>, NoParams> {
  final BudgetRepository budgetRepository;

  FetchAllBudgets(this.budgetRepository);
  @override
  Future<Either<Failure, List<Budget>>> call(NoParams params) async {
    return await budgetRepository.fetchAllBudgets();
  }
}
