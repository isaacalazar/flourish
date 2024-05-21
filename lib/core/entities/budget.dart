import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Budget {
  final String budgetId;
  final String budgetName;
  final int budgetAmount;
  final int budgetMaxAmount;
  final DateTime createdAt;
  final String? posterName;
  final String imageUrl;

  Budget({
    required this.budgetId,
    required this.budgetName,
    required this.budgetAmount,
    required this.budgetMaxAmount,
    required this.createdAt,
    this.posterName,
    required this.imageUrl,
  });
}
