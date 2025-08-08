import 'package:dartz/dartz.dart';

import '../../../../core/api/error/failure.dart';
import '../../data/models/ephemeral_key_model/ephemeral_key_model.dart';
import '../entities/payment_intent.dart';
import '../value_objects/create_payment_intent_params.dart';
import '../value_objects/initialize_payment_sheet_params.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentIntent>> createPaymentIntent(
    CreatePaymentIntentParams createPaymentIntentParams,
  );
  Future<Either<Failure, String>> createEphemeralKey({
    required String customerId,
  });
  Future<Either<Failure, void>> initializePaymentSheet(
    InitializePaymentSheetParams initPaymentSheetParams,
  );
  Future<Either<Failure, void>> presentPaymentSheet();
}
