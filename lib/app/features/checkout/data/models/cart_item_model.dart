List<CartItemModel> cartItemsListFromMap(List<dynamic> list) => list
    .map(
      (element) => CartItemModel.fromMap(
        element,
      ),
    )
    .toList();

class CartItemModel {
  final String id;
  final String title;
  final double price;

  CartItemModel({required this.id, required this.title, required this.price});

  factory CartItemModel.fromMap(Map<String, dynamic> map) =>
      CartItemModel(id: map['id'], title: map['title'], price: map['price']);
}
