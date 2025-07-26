import 'package:checkout/app/features/checkout/presentation/screens/payment_details/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/get_payment_methods_list_usecase.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/payment_method_items.dart';

class PaymentDetails extends StatelessWidget {
  final GetPaymentMethodsListUsecase getPaymentMethodsListUsecase;
  const PaymentDetails({super.key, required this.getPaymentMethodsListUsecase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Details'),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          PaymentMethodItems(
            paymentMethodsList:
                getPaymentMethodsListUsecase.getPaymentMethodsList,
          ),
          const CustomCreditCard(),
        ],
      ),
    );
  }
}
