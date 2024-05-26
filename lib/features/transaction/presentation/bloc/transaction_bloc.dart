import 'package:bloc/bloc.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/transaction/usecases/createTransaction.dart';
import 'package:flourish/features/transaction/usecases/fetchTransaction.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final CreateTransaction _createTransaction;
  final FetchTransaction _fetchTransaction;

  TransactionBloc(
      CreateTransaction createTransaction, FetchTransaction fetchTransaction)
      : _createTransaction = createTransaction,
        _fetchTransaction = fetchTransaction,
        super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) => emit(TransactionLoading()));
    on<TransactionUpload>((event, emit) async {
      final result = await _createTransaction(CreateTransactionParams(
          amount: event.amount, type: event.type, budgetId: event.budgetId));
      final fetchResult =
          await _fetchTransaction(FetchTransactionParams(event.budgetId));

      fetchResult.fold((l) => emit(TransactionFailure()), (budgets) {
        result.fold((l) => emit(TransactionFailure()), (r) {
          emit(TransactionFetchSuccess([...budgets]));
        });
      });
    });
    on<TransactionFetch>((event, emit) async {
      final result =
          await _fetchTransaction(FetchTransactionParams(event.budgetId));

      result.fold((l) => emit(TransactionFailure()), (r) {
        return emit(TransactionFetchSuccess(r));
      });
    });
  }
}
