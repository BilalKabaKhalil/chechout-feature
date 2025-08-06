import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../../domain/entities/payment_intent.dart';
import '../../domain/repositories/payment_repository.dart';
import '../data_source/payment_intent_data.dart';
import '../services/stripe_local_service.dart';

class PaymentRepositoryImp implements PaymentRepository {
  final PaymentIntentData paymentIntentData;
  final StripeLocalService stripeLocalService;
  PaymentRepositoryImp({
    required this.paymentIntentData,
    required this.stripeLocalService,
  });
  @override
  Future<Either<Failure, PaymentIntent>> createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    try {
      final paymentIntentModel = await paymentIntentData.createPaymentIntent(
        amount: amount,
        currency: currency,
      );
      return Right(
        PaymentIntent(clientSecret: paymentIntentModel.clientSecret!),
      );
    } on ServerFailure catch (serverFailure) {
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, void>> initializePaymentSheet({
    required String clientSecret,
    required String merchantDisplayName,
  }) async {
    try {
      await stripeLocalService.initializePaymentSheet(
        clientSecret: clientSecret,
        merchantDisplayName: merchantDisplayName,
      );
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure('Error In Initialize Payment Sheet'));
    }
  }

  @override
  Future<Either<Failure, void>> presentPaymentSheet() async {
    try {
      await stripeLocalService.presentPaymentSheet();
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure('Error In Initialize Payment Sheet'));
    }
  }
}
