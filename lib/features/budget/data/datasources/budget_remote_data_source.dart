import 'dart:io';

import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/features/budget/data/models/budget_model.dart' as bm;
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:flourish/core/entities/user.dart';

abstract class BudgetRemoteDataSource {
  Future<List<bm.BudgetModel>> fetchAllBudgets();
  Future<bm.BudgetModel> createBudget({required bm.BudgetModel budget});
  Future<String> uploadBudgetImage({
    required File image,
    required bm.BudgetModel budget,
  });
}

class BudgetRemoteDataSourceImpl implements BudgetRemoteDataSource {
  final sb.SupabaseClient client;

  BudgetRemoteDataSourceImpl(this.client);

  @override
  Future<List<bm.BudgetModel>> fetchAllBudgets() async {
    try {
      final budgets = await client.from('budgets').select('*, profiles (name)');
      print(budgets);

      return budgets
          .map((budget) => bm.BudgetModel.fromJson(budget)
              .copyWith(posterName: budget['profiles']['name']))
          .toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<String> uploadBudgetImage(
      {required File image, required bm.BudgetModel budget}) async {
    try {
      await client.storage.from('budget_images').upload(budget.budgetId, image);

      return client.storage.from('budget_images').getPublicUrl(budget.budgetId);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<bm.BudgetModel> createBudget({
    required bm.BudgetModel budget,
  }) async {
    try {
      final budgetData =
          await client.from('budgets').insert(budget.toJson()).select();

      return bm.BudgetModel.fromJson(budgetData.first);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
