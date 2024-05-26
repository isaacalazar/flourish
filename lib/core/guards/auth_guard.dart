import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/dependency_injections.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final appUserCubit = serviceLocator<AppUserCubit>();

    if (appUserCubit.state is AppUserLoggedIn) {
      router.push(const HomeRoute());
    } else {
      resolver.next(true);
    }
  }
}
