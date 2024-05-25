// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BudgetInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BudgetInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BudgetInfoPage(
          key: args.key,
          budget: args.budget,
        ),
      );
    },
    CreateBudgetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateBudgetPage(),
      );
    },
    CreateTransactionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateTransactionPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
  };
}

/// generated route for
/// [BudgetInfoPage]
class BudgetInfoRoute extends PageRouteInfo<BudgetInfoRouteArgs> {
  BudgetInfoRoute({
    Key? key,
    required Budget budget,
    List<PageRouteInfo>? children,
  }) : super(
          BudgetInfoRoute.name,
          args: BudgetInfoRouteArgs(
            key: key,
            budget: budget,
          ),
          initialChildren: children,
        );

  static const String name = 'BudgetInfoRoute';

  static const PageInfo<BudgetInfoRouteArgs> page =
      PageInfo<BudgetInfoRouteArgs>(name);
}

class BudgetInfoRouteArgs {
  const BudgetInfoRouteArgs({
    this.key,
    required this.budget,
  });

  final Key? key;

  final Budget budget;

  @override
  String toString() {
    return 'BudgetInfoRouteArgs{key: $key, budget: $budget}';
  }
}

/// generated route for
/// [CreateBudgetPage]
class CreateBudgetRoute extends PageRouteInfo<void> {
  const CreateBudgetRoute({List<PageRouteInfo>? children})
      : super(
          CreateBudgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateBudgetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateTransactionPage]
class CreateTransactionRoute extends PageRouteInfo<void> {
  const CreateTransactionRoute({List<PageRouteInfo>? children})
      : super(
          CreateTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
