import 'package:flutter/material.dart';

import '../../extension/theme_extension.dart';

class AppTextStyle {
  final BuildContext context;

  AppTextStyle(this.context);

  TextStyle get font25W500 => TextStyle(
    color: context.colors.onPrimary,
    fontSize: 25,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  TextStyle get font24W600 => TextStyle(
    color: context.colors.onPrimary,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  TextStyle get font22W500 => TextStyle(
    color: context.colors.onPrimary,
    fontSize: 22,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  TextStyle get font20LessConstraintW400 => TextStyle(
    color: context.colors.onPrimaryFixed,
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  TextStyle get font18W400 => TextStyle(
    color: context.colors.onPrimary,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  TextStyle get font18W600 => TextStyle(
    color: context.colors.onPrimary,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
}
