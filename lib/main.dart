import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/core/routes/app_router.dart';

import 'package:flourish/dependency_injections.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) =>
              AuthBloc(serviceLocator(), serviceLocator(), serviceLocator())),
      BlocProvider(create: (_) => AppUserCubit())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
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
