import 'package:checkout/app/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  final String title, value;
  const PaymentItemInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: context.textStyle.font18W400),
        Text(value, style: context.textStyle.font18W600),
      ],
    );
  }
}
