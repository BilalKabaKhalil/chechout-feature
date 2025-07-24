import 'cart_data.dart';

class TestCartData extends CartData {
  static const List<Map<String, dynamic>> cartItemsList = [
    {'id': '1', 'title': 'this is item number 1', 'price': 20.564},
    {'id': '2', 'title': 'this is item number 1', 'price': 46.36},
    {'id': '3', 'title': 'this is item number 1', 'price': 500.64},
  ];

  @override
  List<Map<String, dynamic>> getCartItems() => cartItemsList;
}
