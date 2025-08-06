import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../entities/payment_intent.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentIntent>> createPaymentIntent({
    required int amount,
    required String currency,
  });
  Future<Either<Failure, void>> initializePaymentSheet({
    required String clientSecret,
    required String merchantDisplayName,
  });
  Future<Either<Failure, void>> presentPaymentSheet();
}
