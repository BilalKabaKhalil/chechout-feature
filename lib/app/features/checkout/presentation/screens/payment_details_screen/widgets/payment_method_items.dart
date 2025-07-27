import 'package:flutter/material.dart';

import '../../../../domain/entities/payment_method.dart';
import 'payment_method_item.dart';

class PaymentMethodItems extends StatefulWidget {
  final List<PaymentMethod> paymentMethodsList;
  const PaymentMethodItems({super.key, required this.paymentMethodsList});

  @override
  State<PaymentMethodItems> createState() => _PaymentMethodItemsState();
}

class _PaymentMethodItemsState extends State<PaymentMethodItems> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                widget.paymentMethodsList
                    .asMap()
                    .entries
                    .map(
                      (paymentMethod) => Padding(
                        padding:
                            paymentMethod.key ==
                                    widget.paymentMethodsList.length - 1
                                ? EdgeInsets.zero
                                : const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = paymentMethod.key;
                            });
                          },
                          child: PaymentMethodItem(
                            imagePath: paymentMethod.value.imagePath,
                            isActive: activeIndex == paymentMethod.key,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
