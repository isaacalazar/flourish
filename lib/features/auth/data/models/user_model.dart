import 'package:flourish/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.globalBalance,
    required super.allocatedBudget,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      name: map['name'] ?? "",
      globalBalance: map['global_balance'] ?? 0,
      allocatedBudget: map['allocated_budget'] ?? 0,
    );
  }

  UserModel copyWith(
      {String? id,
      String? email,
      String? name,
      int? allocatedBudget,
      int? globalBalance}) {
    return UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        globalBalance: globalBalance ?? this.globalBalance,
        allocatedBudget: allocatedBudget ?? this.allocatedBudget);
  }
}
