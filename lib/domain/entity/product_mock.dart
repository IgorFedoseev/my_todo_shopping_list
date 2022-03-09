import 'package:json_annotation/json_annotation.dart';

part 'product_mock.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductMock {
  final List<ShoppingList> shoppingList;
  ProductMock({
    required this.shoppingList,
  });

  factory ProductMock.fromJson(Map<String, dynamic> json) => _$ProductMockFromJson(json);
  Map<String, dynamic> toJson() => _$ProductMockToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
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

  factory ShoppingList.fromJson(Map<String, dynamic> json) => _$ShoppingListFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);
}