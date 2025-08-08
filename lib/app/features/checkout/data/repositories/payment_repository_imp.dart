import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../../domain/entities/payment_intent.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/value_objects/create_payment_intent_params.dart';
import '../../domain/value_objects/initialize_payment_sheet_params.dart';
import '../data_source/stripe_remote_data.dart';
import '../services/stripe_local_service.dart';

class PaymentRepositoryImp implements PaymentRepository {
  final StripeRemoteData stripeRemoteData;
  final StripeLocalService stripeLocalService;
  PaymentRepositoryImp({
    required this.stripeRemoteData,
    required this.stripeLocalService,
  });
  @override
  Future<Either<Failure, PaymentIntent>> createPaymentIntent(
    CreatePaymentIntentParams createPaymentIntentParams,
  ) async {
    try {
      final paymentIntentModel = await stripeRemoteData.createPaymentIntent(
        CreatePaymentIntentParams(
          amount: createPaymentIntentParams.amount,
          currency: createPaymentIntentParams.currency,
          customerId: createPaymentIntentParams.customerId,
        ),
      );
      return Right(
        PaymentIntent(clientSecret: paymentIntentModel.clientSecret!),
      );
    } on ServerFailure catch (serverFailure) {
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, void>> initializePaymentSheet(
    InitializePaymentSheetParams initPaymentSheetParams,
  ) async {
    try {
      await stripeLocalService.initializePaymentSheet(initPaymentSheetParams);
      return const Right(null);
    } on StripeFailure catch (stripeFailure) {
      return Left(stripeFailure);
    }
  }

  @override
  Future<Either<Failure, void>> presentPaymentSheet() async {
    try {
      await stripeLocalService.presentPaymentSheet();
      return const Right(null);
    } on StripeFailure catch (stripeFailure) {
      return Left(stripeFailure);
    }
  }

  @override
  Future<Either<Failure, String>> createEphemeralKey({
    required String customerId,
  }) async {
    try {
      final ephemeralKeyModel = await stripeRemoteData.createEphemeralKey(
        customerId: customerId,
      );
      return Right(ephemeralKeyModel.secret ?? '');
    } on ServerFailure catch (serverFailure) {
      return Left(serverFailure);
    }
  }
}
