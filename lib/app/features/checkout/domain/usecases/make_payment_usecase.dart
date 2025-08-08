import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../entities/payment_intent.dart';
import '../repositories/payment_repository.dart';
import '../value_objects/create_payment_intent_params.dart';
import '../value_objects/initialize_payment_sheet_params.dart';

class MakePaymentUseCase {
  final PaymentRepository paymentRepository;

  MakePaymentUseCase(this.paymentRepository);

  /* 
    this usecase do:
    1. create payment intent
    2. initialize payment sheet
    3. present payment sheet
   */
  Future<Either<Failure, void>> call(
    CreatePaymentIntentParams createPaymentIntentParams,
  ) async {
    final intentResult = await paymentRepository.createPaymentIntent(
      createPaymentIntentParams,
    );
    if (intentResult.isLeft()) {
      // return in case of failure
      return intentResult;
    }
    final intent = intentResult.getOrElse(
      // get payment intent  in case of success
      () => PaymentIntent(clientSecret: ''),
    );

    if (intent.clientSecret.isEmpty) {
      return Left(PaymentFailure('Invalid payment intent: empty clientSecret'));
    }

    final ephemeralKeyResult = await paymentRepository.createEphemeralKey(
      customerId: createPaymentIntentParams.customerId,
    );

    if (ephemeralKeyResult.isLeft()) {
      return ephemeralKeyResult;
    }

    final ephemeralKeySecret = ephemeralKeyResult.getOrElse(
      // get ephemeralKeySecret in case of success
      () => '',
    );

    if (ephemeralKeySecret.isEmpty) {
      return Left(PaymentFailure('Invalid ephemeralKeySecret: empty ephemeralKeySecret'));
    }

    final initializeResult = await paymentRepository.initializePaymentSheet(
      InitializePaymentSheetParams(
        clientSecret: intent.clientSecret,
        merchantDisplayName: 'Bilal',
        customerId: createPaymentIntentParams.customerId,
        customerEphemeralKeySecret: ephemeralKeySecret,
      ),
    );

    if (initializeResult.isLeft()) {
      // return in case of failure
      return initializeResult;
    }

    return await paymentRepository
        .presentPaymentSheet(); // return left for failure and right for success
  }
}
