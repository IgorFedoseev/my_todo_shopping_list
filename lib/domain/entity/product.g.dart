// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingListUnit _$ShoppingListUnitFromJson(Map<String, dynamic> json) =>
    ShoppingListUnit(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      measure: json['measure'] as String,
      isTaken: json['is_taken'] as bool,
    );

Map<String, dynamic> _$ShoppingListUnitToJson(ShoppingListUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'measure': instance.measure,
      'is_taken': instance.isTaken,
    };
