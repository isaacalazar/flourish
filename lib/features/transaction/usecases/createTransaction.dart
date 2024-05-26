import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:flourish/features/transaction/domain/transaction_repository.dart';
import 'package:fpdart/src/either.dart';

class CreateTransaction
    implements UseCase<Transaction, CreateTransactionParams> {
  final TransactionRepository transactionRepository;

  CreateTransaction(this.transactionRepository);

  @override
  Future<Either<Failure, Transaction>> call(
      CreateTransactionParams params) async {
    return await transactionRepository.createTransaction(
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
