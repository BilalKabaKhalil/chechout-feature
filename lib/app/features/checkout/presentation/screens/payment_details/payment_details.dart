import 'package:flutter/material.dart';

import '../../../domain/usecases/get_payment_methods_list_usecase.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/custom_credit_card.dart';
import 'widgets/payment_method_items.dart';

class PaymentDetails extends StatelessWidget {
  final GetPaymentMethodsListUsecase getPaymentMethodsListUsecase;
  const PaymentDetails({super.key, required this.getPaymentMethodsListUsecase});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Details'),
      body: SingleChildScrollView(
        child: SizedBox(
          height:
              mediaQuerySizeOf.height -
              MediaQuery.of(context).viewPadding.top -
              AppBar().preferredSize.height,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8),
              PaymentMethodItems(
                paymentMethodsList:
                    getPaymentMethodsListUsecase.getPaymentMethodsList,
              ),
              const Expanded(child: CustomCreditCard()),
            ],
          ),
        ),
      ),
    );
  }
}
