import 'package:flutter/material.dart';

import '../../../../data/repositories/payment_method_repository_imp.dart';
import '../../../../domain/usecases/get_payment_methods_list_usecase.dart';
import '../../payment_details_screen/widgets/payment_method_items.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 16),
          PaymentMethodItems(
            paymentMethodsList: GetPaymentMethodsListUsecase(
              PaymentMethodRepositoryImp(),
            ).getPaymentMethodsList,
          ),
          const SizedBox(height: 32.0),
          const CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
