import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

enum Measure { piece, kilo, gram, bottles, liters, pack }

extension MeasureAsString on Measure {
  String asString() {
    switch (this) {
      case Measure.piece:
        return 'шт.';
      case Measure.kilo:
        return 'кг';
      case Measure.gram:
        return 'г';
      case Measure.bottles:
        return 'бут.';
      case Measure.liters:
        return 'л';
      case Measure.pack:
        return 'уп.';
    }
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductMock {
  final List<ShoppingList> shoppingList;
  ProductMock({
    required this.shoppingList,
  });

  factory ProductMock.fromJson(Map<String, dynamic> json) =>
      _$ProductMockFromJson(json);
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

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);

  ShoppingList copyWith({
    String? id,
    String? name,
    int? quantity,
    String? measure,
    bool? isTaken,
    bool? isUrgent,
  }) {
    return ShoppingList(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      measure: measure ?? this.measure,
      isTaken: isTaken ?? this.isTaken,
      isUrgent: isUrgent ?? this.isUrgent,
    );
  }
}
