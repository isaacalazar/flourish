import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/routes/app_router.dart';

import 'package:flourish/dependency_injections.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<BudgetBloc>()),
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<TransactionBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<AuthBloc>().add(AuthGetUserData());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flourish',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      routerConfig: _appRouter.config(),
    );
  }
}
