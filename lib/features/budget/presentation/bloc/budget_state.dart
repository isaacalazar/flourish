part of 'budget_bloc.dart';

@immutable
sealed class BudgetState {}

final class BudgetInitial extends BudgetState {}

final class BudgetLoading extends BudgetState {}

final class BudgetSuccess extends BudgetState {}

final class BudgetDisplaySuccess extends BudgetState {
  final List<Budget> budgets;

  BudgetDisplaySuccess(this.budgets);
}

final class BudgetFailure extends BudgetState {}
