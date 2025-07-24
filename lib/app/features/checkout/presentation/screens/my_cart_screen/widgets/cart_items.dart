import 'package:flutter/material.dart';

import '../../../../data/cart_item_model.dart';
import 'cart_item_info.dart';

class CartItems extends StatelessWidget {
  final List<CartItemModel> cartItemsList;
  const CartItems({super.key, required this.cartItemsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:
          (context, index) => CartItemInfo(
            id: cartItemsList[index].id,
            title: cartItemsList[index].title,
            price: cartItemsList[index].price,
          ),
      itemCount: cartItemsList.length,
    );
  }
}
