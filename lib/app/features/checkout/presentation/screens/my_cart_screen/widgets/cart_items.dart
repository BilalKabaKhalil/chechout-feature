import 'package:flutter/material.dart';

import '../../../../domain/entities/product.dart';
import 'cart_item_info.dart';

class CartItems extends StatelessWidget {
  final List<Product> products;
  const CartItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CartItemInfo(
        key: ValueKey<String>(products[index].id),
        title: products[index].title,
        price: products[index].price,
      ),
      itemCount: products.length,
    );
  }
}
