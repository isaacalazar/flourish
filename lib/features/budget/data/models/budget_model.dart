import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';

class BudgetModel extends Budget {
  BudgetModel({
    required super.budgetId,
    required super.budgetName,
    required super.budgetAmount,
    required super.budgetMaxAmount,
    required super.createdAt,
    required super.imageUrl,
    super.posterName,
  });

  BudgetModel copyWith({
    String? budgetId,
    String? budgetName,
    int? budgetAmount,
    int? budgetMaxAmount,
    DateTime? createdAt,
    String? posterName,
    String? imageUrl,
    List<Transaction>? transactions,
  }) {
    return BudgetModel(
      budgetId: budgetId ?? this.budgetId,
      budgetName: budgetName ?? this.budgetName,
      budgetAmount: budgetAmount ?? this.budgetAmount,
      budgetMaxAmount: budgetMaxAmount ?? this.budgetMaxAmount,
      createdAt: createdAt ?? this.createdAt,
      posterName: posterName ?? this.posterName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'budgetId': budgetId,
      'budgetName': budgetName,
      'budgetAmount': budgetAmount,
      'budgetMaxAmount': budgetMaxAmount,
      'createdAt': createdAt.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  factory BudgetModel.fromJson(Map<String, dynamic> map) {
    return BudgetModel(
      budgetId: map['id'] ?? "",
      budgetName: map['name'] ?? "",
      budgetAmount: map['amount'] ?? 0,
      budgetMaxAmount: map['max_amount'] ?? 0,
      createdAt: DateTime.parse(map['updated_at']),
      posterName: map['poster_id'] != null ? map['poster_id'] as String : null,
      imageUrl: map['image_url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Budget(budgetId: $budgetId, budgetName: $budgetName, budgetAmount: $budgetAmount, budgetMaxAmount: $budgetMaxAmount, createdAt: $createdAt, posterName: $posterName, imageUrl: $imageUrl)';
  }
}
