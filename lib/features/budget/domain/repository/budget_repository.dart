import 'dart:io';

import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/features/budget/data/models/budget_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

abstract class BudgetRepository {
  Future<Either<Failure, List<Budget>>> fetchAllBudgets();

  Future<Either<Failure, Budget>> createBudget({
    required String budgetName,
    required int budgetAmount,
    required int budgetMaxAmount,
    required File image,
  });

  Future<Either<Failure, Stream<List<Budget>>>> watchAllBudgets();

  Future<Either<Failure, Transaction>> createTransaction({
    required int amount,
    required String type,
    required String budgetId,
  });

  Future<Either<Failure, Budget>> updateBudget(
      {required String budgetId, required int newAmount});
}
