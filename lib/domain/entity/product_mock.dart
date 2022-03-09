

class ProductMock {
  final List<ShoppingList> shoppingList;
  ProductMock({
    required this.shoppingList,
  });
}

class ShoppingList {
  final String id;
  final String name;
  final int quantity;
  final String measure;
  final bool isTaken;
  final bool isUrgent;
  ShoppingList({
    required this.id,
    required this.name,
    required this.quantity,
    required this.measure,
    required this.isTaken,
    required this.isUrgent,
  });
}