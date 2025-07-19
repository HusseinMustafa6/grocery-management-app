// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDetailsModel _$ItemDetailsModelFromJson(Map<String, dynamic> json) =>
    ItemDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      availableQuantity: (json['Total_Available_Quantity'] as num?)?.toInt(),
      code: json['code'] as String?,
      unitId: (json['base_unit_id'] as num?)?.toInt(),
      minStockLevel: json['minimum_stock_level'] as String?,
      maxStockLevel: json['maximum_stock_level'] as String?,
      storageCondition: json['storage_conditions'] as String?,
      barcode: json['barcode'] as String?,
      supplierId: (json['supplier_id'] as num?)?.toInt(),
      supplierName: json['supplier_name'] as String?,
      unitName: json['base_unit_name'] as String?,
      pricePerUnit: json['selling_price'] as String?,
    );

Map<String, dynamic> _$ItemDetailsModelToJson(ItemDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'Total_Available_Quantity': instance.availableQuantity,
      'code': instance.code,
      'base_unit_id': instance.unitId,
      'minimum_stock_level': instance.minStockLevel,
      'maximum_stock_level': instance.maxStockLevel,
      'storage_conditions': instance.storageCondition,
      'barcode': instance.barcode,
      'supplier_id': instance.supplierId,
      'supplier_name': instance.supplierName,
      'base_unit_name': instance.unitName,
      'selling_price': instance.pricePerUnit,
    };
