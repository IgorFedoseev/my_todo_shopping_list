// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMock _$ProductMockFromJson(Map<String, dynamic> json) => ProductMock(
      shoppingList: (json['shopping_list'] as List<dynamic>)
          .map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductMockToJson(ProductMock instance) =>
    <String, dynamic>{
      'shopping_list': instance.shoppingList.map((e) => e.toJson()).toList(),
    };

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      measure: json['measure'] as String,
      isTaken: json['is_taken'] as bool,
    );

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'measure': instance.measure,
      'is_taken': instance.isTaken,
    };
