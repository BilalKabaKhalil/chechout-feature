import '../entities/payment_method.dart';
import '../repositories/payment_method_repository.dart';

class GetPaymentMethodsListUsecase {
  PaymentMethodRepository paymentMethodRepository;
  GetPaymentMethodsListUsecase({required this.paymentMethodRepository});
  List<PaymentMethod> get getPaymentMethodsList =>
      paymentMethodRepository.getPaymentMethodsList;
}
