part of 'budget_bloc.dart';

@immutable
sealed class BudgetEvent {}

final class BudgetFetchAllBudgets extends BudgetEvent {
  BudgetFetchAllBudgets();
}

final class BudgetUpload extends BudgetEvent {
  final String budgetName;
  final int budgetAmount;
  final int budgetMaxAmount;
  final File image;

  BudgetUpload(
      this.budgetName, this.budgetAmount, this.budgetMaxAmount, this.image);
}

final class BudgetUpdate extends BudgetEvent {
  final String budgetId;
  final int amount;

  BudgetUpdate(this.budgetId, this.amount);
}

final class BudgetWatch extends BudgetEvent {}
