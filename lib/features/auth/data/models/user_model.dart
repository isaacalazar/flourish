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
    print(map);
    print(map['id']);
    print(map['name']);
    return UserModel(
      id: map['id'] as String,
      name: "Isaac",
      email: "salazarisaac1001@gmail.com",
      globalBalance: 0,
      allocatedBudget: 0,
    );
  }
}
