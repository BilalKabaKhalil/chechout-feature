import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/error/failure.dart';
import '../../../../core/constants/end_points.dart';
import '../../../../core/constants/request_content_type.dart';
import '../models/payment_intent/payment_intent_model.dart';


abstract class PaymentIntentData {
  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
  });
}

class PaymentIntentDataImp implements PaymentIntentData {
  ApiConsumer apiConsumer;
  PaymentIntentDataImp(this.apiConsumer);

  @override
  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.createPaymentIntent,
        data: {'amount': amount, 'currency': currency},
        contentType: RequestContentType.formUrlEncodedContentType,
        headers: {'Authorization': ''},
      );
      return PaymentIntentModel.fromJson(response);
    } on ServerFailure catch (_) {
      rethrow;
    }
  }
}
