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

  Session? get currentUserSession;

  Future<UserModel?> getUserCurrentData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<UserModel> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final authRequest = await client.auth
          .signInWithPassword(password: password, email: email);

      if (authRequest == null) {
        print("NULL");
      }

      return UserModel.fromJson(authRequest.user!.toJson());
    } catch (e) {
      print(e.toString());
      print("FAILED AT BOTTOM");
      throw const CustomException("Client Auth not succeeded");
    }
  }

  @override
  Future<UserModel> signUpWithEmail(
      {required String email,
      required String name,
      required String password}) async {
    try {
      print(name);
      print(email);
      print(password);
      final authRequest = await client.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
          'globalBalance': 0,
          'allocatedBudget': 100,
        },
      );

      if (authRequest == null) {
        throw const CustomException("Auth Request was null");
      }
      print("SENT");
      return UserModel.fromJson(authRequest.user!.toJson());
    } catch (e) {
      throw const CustomException("Client Auth not succeeded");
    }
  }

  @override
  Future<UserModel?> getUserCurrentData() async {
    try {
      if (currentUserSession != null) {
        final fetchedUserData = await client
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);

        return UserModel.fromJson(fetchedUserData.first)
            .copyWith(email: currentUserSession!.user.email)
            .copyWith(name: currentUserSession!.user.userMetadata!['name']);
      }
    } catch (e) {}
  }
}
