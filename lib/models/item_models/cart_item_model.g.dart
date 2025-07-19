// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: (json['id'] as num?)?.toInt(),
      itemUnitId: (json['item_unit_id'] as num?)?.toInt(),
      quantity: json['quantity'] as String?,
      howManyEachOneHas: json['how_many_each_one_has'] as String?,
      priceForOne: json['selling_price_for_one'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_unit_id': instance.itemUnitId,
      'quantity': instance.quantity,
      'how_many_each_one_has': instance.howManyEachOneHas,
      'selling_price_for_one': instance.priceForOne,
    };
