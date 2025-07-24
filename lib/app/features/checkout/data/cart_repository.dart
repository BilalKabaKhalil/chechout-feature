import 'cart_data.dart';
import 'cart_item_model.dart';

class CartRepository {
  CartData cartData;
  CartRepository(this.cartData);
  List<CartItemModel> getCartItems() {
    final data = cartData.getCartItems();
    return cartItemsListFromMap(data);
  }
}
