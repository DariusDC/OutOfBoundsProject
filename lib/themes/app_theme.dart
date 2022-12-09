import 'package:flutter/material.dart';
import 'package:out_of_bounds/themes/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.yellow,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.cyan,
      primary: AppColors.yellow,
    ),
    fontFamily: 'Poppins',
  );
}
