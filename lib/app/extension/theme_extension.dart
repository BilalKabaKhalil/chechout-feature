import 'package:flutter/material.dart';

import '../core/theme/app_text_style.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  // TextTheme get textStyle => Theme.of(this).textTheme;
  AppTextStyle get textStyle => AppTextStyle(this);
}
