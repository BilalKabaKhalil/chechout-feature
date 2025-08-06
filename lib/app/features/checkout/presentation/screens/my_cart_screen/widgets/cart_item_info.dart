import 'package:flutter/material.dart';

import '../../../../../../extension/theme_extension.dart';

class CartItemInfo extends StatelessWidget {
  final String title;
  final double price;
  const CartItemInfo({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    final widthWithoutHorizontalPadding = MediaQuery.sizeOf(context).width - 45;
    return Row(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widthWithoutHorizontalPadding / 3 * 2,
          ),
          child: Text(
            title,
            style: context.textStyle.font18W400,
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widthWithoutHorizontalPadding / 3,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${price.toStringAsFixed(2)} \$',
              style: context.textStyle.font18W400,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
