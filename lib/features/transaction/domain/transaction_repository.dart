import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Transaction>> createTransaction({
    required int amount,
    required String type,
    required String budgetId,
  });

  Future<Either<Failure, List<Transaction>>> fetchTransactions(
      {required String budgetId});
}
