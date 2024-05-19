import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flourish/core/entities/budget.dart';

import 'package:flourish/features/budget/usecases/fetchAllBudgets.dart';
import 'package:meta/meta.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final FetchAllBudgets _fetchAllBudgets;

  BudgetBloc(FetchAllBudgets fetchAllBudgets)
      : _fetchAllBudgets = fetchAllBudgets,
        super(BudgetInitial()) {
    on<BudgetEvent>((event, emit) {
      emit(BudgetLoading());
    });

    on<BudgetFetchAllBudgets>((event, emit) async {
      // final result =
      //     await _fetchAllBudgets(FetchAllBudgets());

      // result.fold(
      //   (l) {
      //     print(l.message);
      //     emit(
      //       BudgetFailure(),
      //     );
      //   },
      //   (r) {
      //     print(r);
      //     emit(BudgetDisplaySuccess(r));
      //   },
      // );
    });

    on<BudgetUpload>((event, emit) {});
  }
}
