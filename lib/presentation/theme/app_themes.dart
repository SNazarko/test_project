
import 'package:flutter/material.dart';
import 'package:test_project/presentation/theme/app_fonts.dart';

import 'app_colors.dart';

sealed class AppThemes {

  static ThemeData light() {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
          backgroundColor: AppColors.background,
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            color: AppColors.textPrimary,
            fontWeight: AppFonts.bold,
            fontSize: 16.0,
            height: 1.9,
            letterSpacing: 0,
          ),
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Raleway',
            color: AppColors.textPrimary,
            fontWeight: AppFonts.bold,
            fontSize: 16.0,
            height: 1.9,
            letterSpacing: 0,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Raleway',
            color: AppColors.textPrimary,
            fontWeight: AppFonts.regular,
            fontSize: 14.0,
            height: 2,
            letterSpacing: 0,
          ),

      ),

       scaffoldBackgroundColor: AppColors.background,
    );
  }
}