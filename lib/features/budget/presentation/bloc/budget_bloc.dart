import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/usecases/createBudget.dart';
import 'package:flourish/features/transaction/usecases/createTransaction.dart';

import 'package:flourish/features/budget/usecases/fetchAllBudgets.dart';
import 'package:flourish/features/budget/usecases/watchBudgets.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final FetchAllBudgets _fetchAllBudgets;
  final CreateBudget _createBudget;
  final WatchBudgets _watchBudgets;
  final CreateTransaction _createTransaction;
  BudgetBloc(FetchAllBudgets fetchAllBudgets, CreateBudget createBudget,
      WatchBudgets watchBudgets, CreateTransaction createTransaction)
      : _fetchAllBudgets = fetchAllBudgets,
        _createBudget = createBudget,
        _watchBudgets = watchBudgets,
        _createTransaction = createTransaction,
        super(BudgetInitial()) {
    on<BudgetEvent>((event, emit) {
      emit(BudgetLoading());
    });

    on<BudgetFetchAllBudgets>((event, emit) async {
      final result = await _fetchAllBudgets(NoParams());

      result.fold(
        (l) {
          print(l.message);
          emit(
            BudgetFailure(),
          );
        },
        (r) {
          print(r);
          emit(BudgetDisplaySuccess(r));
        },
      );
    });

    on<BudgetUpload>((event, emit) async {
      final result = await _createBudget(
        CreateBudgetParams(
          event.budgetAmount,
          event.budgetMaxAmount,
          event.budgetName,
          event.image,
        ),
      );

      result.fold((l) {
        print("FAILED");
        print(l.message);
        emit(BudgetFailure());
      }, (r) {
        print(r.toString());
        print("SUCCEEDED");
        emit(BudgetSuccess());
      });
    });

    on<BudgetWatch>((event, emit) async {
      final stream = await _watchBudgets(NoParams());

      await emit.forEach(stream, onData: (state) {
        print(state);
        print("GOT NEW STREAM ITEM");
        return BudgetDisplaySuccess(state);
      });
    });

    on<TransactionUpload>((event, emit) async {
      final result = await _createTransaction(CreateTransactionParams(
          amount: event.amount, type: event.type, budgetId: event.budgetId));

      result.fold(
        (l) => emit(BudgetFailure()),
        (r) => emit(
          TransactionDisplaySuccess([r]),
        ),
      );
    });
  }
}
