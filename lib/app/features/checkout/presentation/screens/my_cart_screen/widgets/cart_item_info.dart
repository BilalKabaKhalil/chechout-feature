import 'package:flutter/material.dart';

import '../../../../../../extension/theme_extension.dart';

class CartItemInfo extends StatelessWidget {
  final String title,id;
  final double price;
  const CartItemInfo({super.key, required this.title, required this.price, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: context.textStyle.font18W400,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Text(
          price.toStringAsFixed(2),
          style: context.textStyle.font18W400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
