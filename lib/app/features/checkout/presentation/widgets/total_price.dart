import 'package:flutter/material.dart';

import '../../../../extension/theme_extension.dart';

class TotalPrice extends StatelessWidget {
  final double totalPrice;
  const TotalPrice({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Total',
          style: context.textStyle.font24W600,
          textAlign: TextAlign.left,
        ),
        const Spacer(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width / 2,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${totalPrice.toStringAsFixed(2)} \$',
              style: context.textStyle.font24W600,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
