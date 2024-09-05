import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_router.dart';
import 'package:trackizer/core/constants/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Trackizer',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
