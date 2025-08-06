import 'package:flutter_stripe/flutter_stripe.dart';

abstract class StripeLocalService {
  Future<void> initializePaymentSheet({
    required String clientSecret,
    required String merchantDisplayName,
  });
  Future<void> presentPaymentSheet();
}

class StripeLocalServiceImpl implements StripeLocalService {
  @override
  Future<void> initializePaymentSheet({
    required String clientSecret,
    required String merchantDisplayName,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: merchantDisplayName,
      ),
    );
  }

  @override
  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
}
