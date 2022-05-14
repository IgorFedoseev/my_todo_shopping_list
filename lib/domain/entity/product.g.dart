// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingListUnit _$ShoppingListUnitFromJson(Map<String, dynamic> json) =>
    ShoppingListUnit(
      productId: json['productId'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      measure: json['measure'] as String,
      isTaken: ShoppingListUnit._boolFromInt(json['isTaken'] as int),
    );

Map<String, dynamic> _$ShoppingListUnitToJson(ShoppingListUnit instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
      'measure': instance.measure,
      'isTaken': ShoppingListUnit._boolToInt(instance.isTaken),
    };
