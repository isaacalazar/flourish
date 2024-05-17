import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      theme: ThemeData.light(useMaterial3: true).copyWith(
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
