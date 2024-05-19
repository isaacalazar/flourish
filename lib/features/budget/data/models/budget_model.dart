import 'package:flourish/core/entities/budget.dart';

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
      'posterName': posterName,
      'imageUrl': imageUrl,
    };
  }

  factory BudgetModel.fromJson(Map<String, dynamic> map) {
    return BudgetModel(
      budgetId: map['budgetId'] as String,
      budgetName: map['budgetName'] as String,
      budgetAmount: map['budgetAmount'] as int,
      budgetMaxAmount: map['budgetMaxAmount'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      posterName:
          map['posterName'] != null ? map['posterName'] as String : null,
      imageUrl: '',
    );
  }
}
