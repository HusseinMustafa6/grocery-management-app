// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemUnitsModel _$ItemUnitsModelFromJson(Map<String, dynamic> json) =>
    ItemUnitsModel(
      units: (json['data'] as List<dynamic>)
          .map((e) => ItemUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemUnitsModelToJson(ItemUnitsModel instance) =>
    <String, dynamic>{
      'data': instance.units,
    };

ItemUnitModel _$ItemUnitModelFromJson(Map<String, dynamic> json) =>
    ItemUnitModel(
      id: (json['id'] as num?)?.toInt(),
      sellingPrice: json['selling_price'] as String?,
      conversionFactor: json['conversion_factor'] as String?,
      unitId: (json['unit_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemUnitModelToJson(ItemUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selling_price': instance.sellingPrice,
      'conversion_factor': instance.conversionFactor,
      'unit_id': instance.unitId,
    };
