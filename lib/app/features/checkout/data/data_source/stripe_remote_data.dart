import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/error/failure.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/constants/end_points.dart';
import '../../../../core/constants/request_content_type.dart';
import '../../domain/value_objects/create_payment_intent_params.dart';
import '../models/ephemeral_key_model/ephemeral_key_model.dart';
import '../models/payment_intent/payment_intent_model.dart';

abstract class StripeRemoteData {
  Future<PaymentIntentModel> createPaymentIntent(
    CreatePaymentIntentParams createPaymentIntentParams,
  );
  Future<EphemeralKeyModel> createEphemeralKey({required String customerId});
}

class StripeRemoteDataImp implements StripeRemoteData {
  ApiConsumer apiConsumer;
  StripeRemoteDataImp(this.apiConsumer);

  @override
  Future<PaymentIntentModel> createPaymentIntent(
    CreatePaymentIntentParams createPaymentIntentParams,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.createPaymentIntent,
        data: {
          'amount': (createPaymentIntentParams.amount * 100),
          'currency': createPaymentIntentParams.currency,
          'customer': createPaymentIntentParams.customerId,
        },
        contentType: RequestContentType.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer ${AppKeys.secretKey}'},
      );
      return PaymentIntentModel.fromJson(response);
    } on ServerFailure catch (_) {
      rethrow;
    }
  }

  @override
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.createEphemeralKey,
        data: {'customer': customerId},
        contentType: RequestContentType.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer ${AppKeys.secretKey}', 'Stripe-Version': '2025-06-30.basil'},
      );
      return EphemeralKeyModel.fromJson(response);
    } on ServerFailure catch (_) {
      rethrow;
    }
  }
}
