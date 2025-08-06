import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (_) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkGrayColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
