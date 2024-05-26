import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:flourish/features/transaction/domain/transaction_repository.dart';
import 'package:fpdart/src/either.dart';

class FetchTransaction
    implements UseCase<List<Transaction>, FetchTransactionParams> {
  final TransactionRepository transactionRepository;

  FetchTransaction(this.transactionRepository);

  @override
  Future<Either<Failure, List<Transaction>>> call(
      FetchTransactionParams params) async {
    return await transactionRepository.fetchTransactions(
        budgetId: params.budgetId);
  }
}

class FetchTransactionParams {
  final String budgetId;

  FetchTransactionParams(this.budgetId);
}
