import 'dart:io';

import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/features/budget/data/datasources/budget_remote_data_source.dart';
import 'package:flourish/features/budget/data/models/budget_model.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase/src/supabase_stream_builder.dart';
import 'package:uuid/uuid.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetRemoteDataSource budgetRemoteDataSource;
  BudgetRepositoryImpl(this.budgetRemoteDataSource);

  @override
  Future<Either<Failure, List<Budget>>> fetchAllBudgets() async {
    try {
      final budgets = await budgetRemoteDataSource.fetchAllBudgets();

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

      final result =
          await budgetRemoteDataSource.createBudget(budget: newBudget);

      return right(result);
    } on CustomException catch (e) {
      return left(Failure(e.customMessage));
    }
  }

  @override
  Future<Either<Failure, Stream<List<BudgetModel>>>> watchAllBudgets() async {
    try {
      final result = await budgetRemoteDataSource.watchAllBudgets();

      return right(result);
    } on CustomException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
