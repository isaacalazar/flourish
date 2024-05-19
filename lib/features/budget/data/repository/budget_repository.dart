import 'dart:io';

import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/features/budget/data/datasources/budget_remote_data_source.dart';
import 'package:flourish/features/budget/data/models/budget_model.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:uuid/uuid.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetRemoteDataSource budgetRemoteDataSource;
  BudgetRepositoryImpl(this.budgetRemoteDataSource);

  @override
  Future<Either<Failure, List<Budget>>> fetchAllBudgets() async {
    try {
      final budgets = await budgetRemoteDataSource.fetchAllBudgets();

      if (budgets != null) {
        return left(Failure("Budgets could not load"));
      }

      return right(budgets);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }

  @override
  Future<Either<Failure, Budget>> createBudget({
    required String budgetName,
    required int budgetAmount,
    required int budgetMaxAmount,
    required File image,
  }) async {
    try {
      BudgetModel newBudget = BudgetModel(
          budgetId: Uuid().v1(),
          budgetName: budgetName,
          budgetAmount: budgetAmount,
          budgetMaxAmount: budgetMaxAmount,
          createdAt: DateTime.now(),
          imageUrl: "");

      final imageUrl = await budgetRemoteDataSource.uploadBudgetImage(
          image: image, budget: newBudget);

      newBudget = newBudget.copyWith(imageUrl: imageUrl);

      return right(newBudget);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }
}
