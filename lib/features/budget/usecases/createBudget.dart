import 'dart:io';

import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';

class CreateBudget implements UseCase<Budget, CreateBudgetParams> {
  final BudgetRepository budgetRepository;

  CreateBudget(this.budgetRepository);

  @override
  Future<Either<Failure, Budget>> call(CreateBudgetParams params) async {
    return await budgetRepository.createBudget(
      budgetName: params.budgetName,
      budgetAmount: params.budgetAmount,
      budgetMaxAmount: params.budgetMaxAmount,
      image: params.image,
    );
  }
}

class CreateBudgetParams {
  final String budgetName;
  final int budgetAmount;
  final int budgetMaxAmount;
  final File image;

  CreateBudgetParams(
      this.budgetAmount, this.budgetMaxAmount, this.budgetName, this.image);
}
