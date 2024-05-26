import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/features/transaction/data/models/transaction_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TransactionRemoteDataSource {
  Future<TransactionModel> createTransaction(
      {required Transaction transaction});

  Future<List<TransactionModel>> fetchTransactions({required String budgetId});
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final SupabaseClient client;
  TransactionRemoteDataSourceImpl(this.client);

  @override
  Future<TransactionModel> createTransaction(
      {required Transaction transaction}) async {
    try {
      final transactionData = await client
          .from('transactions')
          .insert({
            'id': transaction.id,
            'created_at': transaction.createdAt.toIso8601String(),
            'amount': transaction.amount,
            'type': transaction.type,
            'chained_budget_id': transaction.budgetId
          })
          .select()
          .single();

      print(transactionData);
      return TransactionModel.fromJson(transactionData);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> fetchTransactions(
      {required String budgetId}) async {
    try {
      try {
        final budgets = await client
            .from('transactions')
            .select('*')
            .eq('chained_budget_id', budgetId)
            .order('created_at', ascending: false);

        return budgets
            .map((budget) => TransactionModel.fromJson(budget))
            .toList();
      } catch (e) {
        throw CustomException(e.toString());
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
