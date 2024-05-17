import 'dart:convert';

import 'package:flourish/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.globalBalance,
    required super.allocatedBudget,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'globalBalance': globalBalance,
      'allocatedBudget': allocatedBudget,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      globalBalance: map['globalBalance'] as int,
      allocatedBudget: map['allocatedBudget'] as int,
    );
  }
}
