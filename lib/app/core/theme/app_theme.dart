import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightBlueColor,
      onPrimary: AppColors.blackColor,
      onPrimaryFixed: AppColors.lessOpacityDarkText,
      surfaceContainerLow: AppColors.grayColor,
    );
    return ThemeData(brightness: Brightness.light, colorScheme: colorScheme);
  }
}
