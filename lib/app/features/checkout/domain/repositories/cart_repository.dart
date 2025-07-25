import '../entities/cart.dart';

abstract class CartRepository {
  Future<Cart> getCartData();
}