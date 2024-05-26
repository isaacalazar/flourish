part of 'transaction_bloc.dart';

@immutable
sealed class TransactionEvent {}

final class TransactionUpload extends TransactionEvent {
  final String type;
  final String budgetId;
  final int amount;
  TransactionUpload({
    required this.type,
    required this.budgetId,
    required this.amount,
  });
}

final class TransactionFetch extends TransactionEvent {
  final String budgetId;

  TransactionFetch({required this.budgetId});
}
