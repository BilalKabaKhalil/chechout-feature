import '../../domain/entities/cart.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_source/cart_data.dart';
import '../models/cart_item_model.dart';

class CartRepositoryImp implements CartRepository {
  final CartData cartData;
  CartRepositoryImp(this.cartData);
  @override
  Future<Cart> getCartData() async {
    final data = await cartData.getCartItems();
    final cartItems = cartItemsListFromMap(data);
    final products = cartItems
        .map(
          (cartItem) => Product(
            id: cartItem.id,
            title: cartItem.title,
            price: cartItem.price,
          ),
        )
        .toList();
    return Cart(products);
  }
}
