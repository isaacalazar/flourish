import 'package:flourish/core/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required super.id,
    required super.budgetId,
    required super.type,
    required super.amount,
    required super.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
      amount: map['amount'] ?? 0,
      id: map['id'] ?? "",
      budgetId:
          map['chained_budget_id'] != null ? map['chained_budget_id'] : "",
      type: map['type'] ?? "",
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'budgetId': budgetId,
      'id': id,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
      'type': type,
    };
  }
}
