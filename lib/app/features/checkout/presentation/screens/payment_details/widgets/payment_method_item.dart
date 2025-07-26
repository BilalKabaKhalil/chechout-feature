import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  final bool isActive;
  final String imagePath;
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final widthWithoutHorizontalPadding = MediaQuery.sizeOf(context).width - 80;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: widthWithoutHorizontalPadding / 3,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.5,
          color: isActive ? AppColors.greenColor : AppColors.grayColor,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: isActive ? AppColors.greenColor : AppColors.whiteColor,
            blurRadius: 4,
            offset: Offset.zero,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 2 / 1.2,
        child: Center(
          child: SvgPicture.asset(imagePath, height: 24, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
