import 'package:checkout/app/core/constants/image_assets.dart';
import 'package:checkout/app/core/theme/app_colors.dart';
import 'package:checkout/app/extension/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(ImageAssets.creditCardLogoSVG),
          const SizedBox(width: 23),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              maxLines: 2,
              softWrap: true,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Credit Card\n',
                    style: context.textStyle.font18W400,
                  ),
                  TextSpan(
                    text: 'Mastercard **78',
                    style: context.textStyle.font16W400.copyWith(
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
