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
      print('sign in with email');
      final authRequest = await client.auth
          .signInWithPassword(password: password, email: email);

      if (authRequest.user == null) {
        throw const CustomException("Auth User was null");
      }

      final currentDataRequest = await getUserCurrentData();

      if (currentDataRequest == null) {
        throw const CustomException("User not found");
      }

      return currentDataRequest;
    } catch (e) {
      throw const CustomException("Client Auth not succeeded");
    }
  }

  @override
  Future<UserModel> signUpWithEmail(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final authRequest = await client.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
        },
      );

      if (authRequest.user == null) {
        throw const CustomException("Auth User was null");
      }

      final createProfileUserRequest = await client
          .from('profiles')
          .insert({
            "id": authRequest.user!.id,
            "name": name,
            "global_balance": 100,
            "allocated_budget": 0,
          })
          .select()
          .single();

      return UserModel.fromJson(authRequest.user!.toJson())
          .copyWith(
              allocatedBudget: createProfileUserRequest['allocated_budget'])
          .copyWith(globalBalance: createProfileUserRequest['global_balance']);
    } catch (e) {
      print(e.toString());
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
            .eq('id', currentUserSession!.user.id)
            .single();

        return UserModel.fromJson(fetchedUserData)
            .copyWith(email: currentUserSession!.user.email);
      }
    } catch (e) {
      throw const CustomException("Client Auth not succeeded");
    }
  }
}
