import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/features/auth/presentation/pages/login_screen.dart';
import 'package:flourish/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:flourish/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:flourish/features/budget/presentation/pages/budget_info_page.dart';
import 'package:flourish/features/budget/presentation/pages/create_budget_page.dart';
import 'package:flourish/features/budget/presentation/pages/create_transaction_page.dart';

import 'package:flourish/features/budget/presentation/pages/home_page.dart';
import 'package:flourish/features/budget/usecases/createTransaction.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(page: CreateBudgetRoute.page),
        AutoRoute(page: BudgetInfoRoute.page),
        AutoRoute(page: CreateTransactionRoute.page)
      ];
}
