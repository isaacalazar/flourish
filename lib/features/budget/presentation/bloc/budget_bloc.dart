import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/usecases/createBudget.dart';

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

  BudgetBloc(FetchAllBudgets fetchAllBudgets, CreateBudget createBudget,
      WatchBudgets watchBudgets)
      : _fetchAllBudgets = fetchAllBudgets,
        _createBudget = createBudget,
        _watchBudgets = watchBudgets,
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

    on<TransactionUpload>((event, emit) {});
  }
}
