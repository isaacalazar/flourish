import 'package:flourish/core/errors/custom_exception.dart';
import 'package:flourish/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmail({
    required String email,
    required String name,
    required String password,
  });
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> signInWithEmail(
      {required String email, required String password}) async {
    try {
      print("TOP");
      print(password);
      print(email);
      final auth_request = await client.auth
          .signInWithPassword(password: password, email: email);
      print(auth_request);
      if (auth_request == null) {
        print("NULL");
        throw CustomException("Auth Request was null");
      }
      print(UserModel.fromJson(auth_request.user!.toJson()));
      return UserModel.fromJson(auth_request.user!.toJson());
    } catch (e) {
      print(e.toString());
      print("FAILED AT BOTTOM");
      throw CustomException("Client Auth not succeeded");
    }
  }

  @override
  Future<UserModel> signUpWithEmail(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final auth_request = await client.auth.signUp(
        password: password.toString(),
        email: email.toString(),
        data: {
          'name': name.toString(),
          'email': email.toString(),
          'globalBalance': 0,
          'allocatedBudget': 100,
        },
      );

      if (auth_request == null) {
        throw CustomException("Auth Request was null");
      }
      print("SENT");
      return UserModel.fromJson(auth_request.user!.toJson());
    } catch (e) {
      throw CustomException("Client Auth not succeeded");
    }
  }
}
