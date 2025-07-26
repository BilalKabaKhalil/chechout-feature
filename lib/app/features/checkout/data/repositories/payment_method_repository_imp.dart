import '../../../../core/constants/image_assets.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/payment_method_repository.dart';

class PaymentMethodRepositoryImp implements PaymentMethodRepository {
  @override
  List<PaymentMethod> get getPaymentMethodsList => [
    PaymentMethod(imagePath: ImageAssets.creditCardSVG),
    PaymentMethod(imagePath: ImageAssets.paypalSVG),
  ];
}
