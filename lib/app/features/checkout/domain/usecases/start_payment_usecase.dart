import 'package:checkout/app/features/checkout/domain/entities/payment_intent.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../repositories/payment_repository.dart';

class StartPaymentUseCase {
  final PaymentRepository paymentRepository;

  StartPaymentUseCase(this.paymentRepository);

  /* 
    this usecase do:
    1. create payment intent
    2. initialize payment sheet
    3. present payment sheet
   */
  Future<Either<Failure, void>> call({
    required int amount,
    required String currency,
  }) async {
    final intentResult = await paymentRepository.createPaymentIntent(
      amount: amount,
      currency: currency,
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

    final initializeResult = await paymentRepository.initializePaymentSheet(
      clientSecret: intent.clientSecret,
      merchantDisplayName: '',
    );

    if (initializeResult.isLeft()) {
      // return in case of failure
      return initializeResult;
    }

    return await paymentRepository
        .presentPaymentSheet(); // return left for failure and right for success
  }
}
