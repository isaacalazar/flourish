// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final int globalBalance;
  final int allocatedBudget;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.globalBalance,
    required this.allocatedBudget,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, globalBalance: $globalBalance, allocatedBudget: $allocatedBudget)';
  }
}
