import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class GetCartDataUseCase {
  final CartRepository cartRepository;
  GetCartDataUseCase(this.cartRepository);

  Future<Cart> getCartData() async {
    return await cartRepository.getCartData();
  }
}
