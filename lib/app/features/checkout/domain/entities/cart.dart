import 'product.dart';

class Cart {
  final List<Product> products;
  Cart(this.products);

  double get getTotalPrice => products.fold(
    0,
    (previousValue, element) => previousValue + element.price,
  );
}
