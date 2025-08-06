import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/image_assets.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../extension/theme_extension.dart';
import '../../../widgets/total_price.dart';
import 'card_info_widget.dart';
import 'payment_item_info.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.lightGrayColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, right: 20, left: 20),
        child: Column(
          children: <Widget>[
            Text('Thank you!', style: context.textStyle.font25W500),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Your transaction was successful',
                style: context.textStyle.font20LessConstraintW400,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(title: 'Date', value: '01/24/2023'),
            const SizedBox(height: 20),
            const PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            const SizedBox(height: 20),
            const PaymentItemInfo(title: 'To', value: 'Sam Louis'),
            const Divider(
              height: 60,
              color: AppColors.darkGrayColor,
              thickness: 2,
            ),
            const TotalPrice(totalPrice: 500.4),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(ImageAssets.barcodeSVG),
                Container(
                  width: 114,
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.5,
                        color: AppColors.greenColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Paid',
                      style: context.textStyle.font24W600.copyWith(
                        color: AppColors.greenColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * 0.2 + 20) / 2 - 30,
            ),
          ],
        ),
      ),
    );
  }
}
