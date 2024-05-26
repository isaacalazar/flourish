import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/features/transaction/data/datasources/transaction_remote_data_source.dart';
import 'package:flourish/features/transaction/domain/transaction_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:uuid/uuid.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource transactionRemoteDataSource;

  TransactionRepositoryImpl(this.transactionRemoteDataSource);

  @override
  Future<Either<Failure, Transaction>> createTransaction(
      {required int amount,
      required String type,
      required String budgetId}) async {
    try {
      final transaction = Transaction(
        id: Uuid().v1(),
        budgetId: budgetId,
        type: type,
        amount: amount,
        createdAt: DateTime.now(),
      );

      final result = await transactionRemoteDataSource.createTransaction(
          transaction: transaction);

      return right(result);
    } on CustomException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> fetchTransactions(
      {required String budgetId}) async {
    try {
      return right(await transactionRemoteDataSource.fetchTransactions(
          budgetId: budgetId));
    } on CustomException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
