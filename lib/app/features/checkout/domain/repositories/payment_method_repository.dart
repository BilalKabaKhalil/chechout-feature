import '../entities/payment_method.dart';

abstract class PaymentMethodRepository {
  List<PaymentMethod> get getPaymentMethodsList;
}
