import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/custom_check_mark_circle.dart';
import 'widgets/custom_dashed_line.dart';
import 'widgets/success_card.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            const SuccessCard(),
            Positioned(
              left: -20,
              bottom: height * 0.2,
              child: const CircleAvatar(backgroundColor: AppColors.whiteColor),
            ),
            Positioned(
              right: -20,
              bottom: height * 0.2,
              child: const CircleAvatar(backgroundColor: AppColors.whiteColor),
            ),
            Positioned(
              bottom:
                  height * 0.2 +
                  20, // 20 is radius of circle to center line with circle
              right: 20 + 8,
              left: 20 + 8,
              child: const CustomDashedLine(),
            ),
            const Positioned(
              right: 0,
              left: 0,
              top: -50,
              child: CustomCheckMarkCircle(),
            ),
          ],
        ),
      ),
    );
  }
}
