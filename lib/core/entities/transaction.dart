class Transaction {
  final String id;
  final String budgetId;
  final String type;
  final int amount;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.budgetId,
    required this.type,
    required this.amount,
    required this.createdAt,
  });
}
