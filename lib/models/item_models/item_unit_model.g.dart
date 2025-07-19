// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemUnitModel _$ItemUnitModelFromJson(Map<String, dynamic> json) =>
    ItemUnitModel(
      id: (json['id'] as num?)?.toInt(),
      sellingPrice: json['selling_price'] as String?,
      conversionFactor: json['conversion_factor'] as String?,
    );

Map<String, dynamic> _$ItemUnitModelToJson(ItemUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selling_price': instance.sellingPrice,
      'conversion_factor': instance.conversionFactor,
    };
