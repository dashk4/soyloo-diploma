import 'package:flutter/material.dart';

import 'app_router.dart';
import 'constants/values.dart';
import 'global/app_theme.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static String? accessToken;
  static AppRole role = AppRole.consumer;
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppValues.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
