import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/errors/failure.dart';
import 'package:flourish/core/utils/use_case.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WatchBudgets {
  final BudgetRepository budgetRepository;
  WatchBudgets(this.budgetRepository);

  Future<Stream<List<Budget>>> call(NoParams params) async {
    final streamResult = await budgetRepository.watchAllBudgets();

    Stream<List<Budget>> budgetStream = Stream.empty();
    streamResult.fold(
        (l) => budgetStream = Stream.empty(), (r) => budgetStream = r);

    print(await budgetStream.isEmpty);

    return budgetStream;
  }
}
