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

@JsonSerializable(fieldRename: FieldRename.snake)
class ShoppingListUnit {
  final String id;
  final String name;
  final int quantity;
  final String measure;
  final bool isTaken;
  ShoppingListUnit({
    required this.id,
    required this.name,
    required this.quantity,
    required this.measure,
    required this.isTaken,
  });

  factory ShoppingListUnit.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListUnitFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingListUnitToJson(this);

  ShoppingListUnit copyWith({
    String? id,
    String? name,
    int? quantity,
    String? measure,
    bool? isTaken,
  }) {
    return ShoppingListUnit(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      measure: measure ?? this.measure,
      isTaken: isTaken ?? this.isTaken,
    );
  }
}
