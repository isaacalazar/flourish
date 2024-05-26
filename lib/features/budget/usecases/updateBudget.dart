import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';

class UpdateBudget implements UseCase<Budget, UpdateBudgetParams> {
  final BudgetRepository budgetRepository;

  UpdateBudget(this.budgetRepository);

  @override
  Future<Either<Failure, Budget>> call(params) async {
    return await budgetRepository.updateBudget(
        budgetId: params.budgetId, newAmount: params.amount);
  }
}

class UpdateBudgetParams {
  final String budgetId;
  final int amount;

  UpdateBudgetParams(this.budgetId, this.amount);
}
