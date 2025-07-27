import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/image_assets.dart';
import '../../../../../../core/theme/app_colors.dart';

class CustomCheckMarkCircle extends StatelessWidget {
  const CustomCheckMarkCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.grayColor,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColors.greenColor,
        child: Center(
          child: SvgPicture.asset(ImageAssets.chickMarkSVG,),
        ),
      ),
    );
  }
}
