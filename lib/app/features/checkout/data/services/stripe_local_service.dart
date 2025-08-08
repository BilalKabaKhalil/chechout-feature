import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/api/error/failure.dart';
import '../../domain/value_objects/initialize_payment_sheet_params.dart';

abstract class StripeLocalService {
  Future<void> initializePaymentSheet(InitializePaymentSheetParams initPaymentSheetParams,);
  Future<void> presentPaymentSheet();
}

class StripeLocalServiceImpl implements StripeLocalService {
  @override
  Future<void> initializePaymentSheet(
    InitializePaymentSheetParams initPaymentSheetParams,
  ) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetParams.clientSecret,
          merchantDisplayName: initPaymentSheetParams.merchantDisplayName,
          customerId: initPaymentSheetParams.customerId,
          customerEphemeralKeySecret:
              initPaymentSheetParams.customerEphemeralKeySecret,
        ),
      );
    } on StripeException catch (e) {
      throw StripeFailure.fromResponse(e);
    }
  }

  @override
  Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      throw StripeFailure.fromResponse(e);
    }
  }
}
