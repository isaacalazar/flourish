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
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> signInWithEmail(
      {required String email, required String password}) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmail(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final auth_request =
          await client.auth.signUp(email: email, password: password);

      if (auth_request == null) {
        throw CustomException("Auth Request was null");
      }
      return UserModel.fromJson(auth_request.user!.toJson());
    } catch (e) {
      throw CustomException("Client Auth not succeeded");
    }
  }
}
