import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';

class CreateTransaction
    implements UseCase<Transaction, CreateTransactionParams> {
  final BudgetRepository budgetRepository;

  CreateTransaction({required this.budgetRepository});
  @override
  Future<Either<Failure, Transaction>> call(
      CreateTransactionParams params) async {
    return await budgetRepository.createTransaction(
        amount: params.amount, type: params.type, budgetId: params.budgetId);
  }
}

class CreateTransactionParams {
  final int amount;
  final String type;
  final String budgetId;
  CreateTransactionParams({
    required this.amount,
    required this.type,
    required this.budgetId,
  });
}
