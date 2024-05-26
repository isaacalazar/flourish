part of 'transaction_bloc.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionSuccess extends TransactionState {
  final Transaction transaction;

  TransactionSuccess(this.transaction);
}

final class TransactionFetchSuccess extends TransactionState {
  final List<Transaction> transactions;

  TransactionFetchSuccess(this.transactions);
}

final class TransactionLoading extends TransactionState {}

final class TransactionFailure extends TransactionState {}
