import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/image_assets.dart';
import '../../../../extension/theme_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Center(child: SvgPicture.asset(ImageAssets.arrowSVG)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textStyle.font25W500,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
