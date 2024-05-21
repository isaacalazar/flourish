import 'dart:io';

import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/features/budget/data/models/budget_model.dart' as bm;
import 'package:flourish/features/budget/data/models/budget_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flourish/core/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BudgetRemoteDataSource {
  Future<List<BudgetModel>> fetchAllBudgets();
  Future<BudgetModel> createBudget({required BudgetModel budget});
  Future<String> uploadBudgetImage({
    required File image,
    required BudgetModel budget,
  });

  Session? get currentUserSession;

  Future<Stream<List<BudgetModel>>> watchAllBudgets();
}

class BudgetRemoteDataSourceImpl implements BudgetRemoteDataSource {
  final SupabaseClient client;

  BudgetRemoteDataSourceImpl(this.client);

  @override
  Future<List<BudgetModel>> fetchAllBudgets() async {
    try {
      if (currentUserSession != null) {
        final budgets = await client
            .from('budgets')
            .select('*, profiles (name)')
            .eq('poster_id', currentUserSession!.user.id);

        return budgets
            .map((budget) => BudgetModel.fromJson(budget)
                .copyWith(posterName: budget['profiles']['name']))
            .toList();
      }

      return List.empty();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<String> uploadBudgetImage(
      {required File image, required BudgetModel budget}) async {
    try {
      await client.storage.from('budget_images').upload(budget.budgetId, image);

      return client.storage.from('budget_images').getPublicUrl(budget.budgetId);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<BudgetModel> createBudget({
    required BudgetModel budget,
  }) async {
    try {
      if (currentUserSession != null) {
        final budgetData = await client
            .from('budgets')
            .insert({
              'id': budget.budgetId,
              'poster_id': currentUserSession!.user.id,
              'updated_at': DateTime.now().toIso8601String(),
              'max_amount': budget.budgetMaxAmount,
              'amount': budget.budgetAmount,
              'name': budget.budgetName,
              'image_url': budget.imageUrl,
            })
            .select()
            .single();

        return BudgetModel.fromJson(budgetData);
      }
      return BudgetModel.fromJson({});
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<Stream<List<BudgetModel>>> watchAllBudgets() async {
    try {
      if (currentUserSession != null) {
        print("SESSION IS NOT NULL");
        final result = client
            .from('budgets')
            .stream(primaryKey: ['id'])
            .eq(
              'poster_id',
              currentUserSession!.user.id,
            )
            .map(
              (data) {
                return data.map((e) => BudgetModel.fromJson(e)).toList();
              },
            );
        print("MAPPING ALL OUT");
        print(result);
        return result;
      }
      return const Stream.empty();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
