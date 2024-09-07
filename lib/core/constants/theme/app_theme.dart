import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class AppTheme {
  static get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.grey80,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: 'Inter',
        useMaterial3: true,
      );
}
