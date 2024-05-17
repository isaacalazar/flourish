import 'package:auto_route/auto_route.dart';
import 'package:flourish/features/auth/presentation/pages/login_screen.dart';
import 'package:flourish/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:flourish/features/budget/presentation/pages/home_page.dart';
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
      ];
}
