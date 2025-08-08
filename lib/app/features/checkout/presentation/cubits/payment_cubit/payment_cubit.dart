import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/error/failure.dart';
import '../../../domain/usecases/make_payment_usecase.dart';
import '../../../domain/value_objects/create_payment_intent_params.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final MakePaymentUseCase makePaymentUseCase;
  PaymentCubit(this.makePaymentUseCase) : super(PaymentInitial());
  Future<void> makePayment({
    required num amount,
    required String currency,
    required String customerId,
  }) async {
    emit(PaymentLoading());
    final res = await makePaymentUseCase.call(
      CreatePaymentIntentParams(
        amount: amount,
        currency: currency,
        customerId: customerId,
      ),
    );
    res.fold(
      (failure) {
        if (failure is CanceledFailure) {
          emit(PaymentCanceled());
          return;
        }
        emit(PaymentFailure(failure.message));
      },
      (_) {
        emit(PaymentSuccess());
      },
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
