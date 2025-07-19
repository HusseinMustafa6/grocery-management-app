import 'package:json_annotation/json_annotation.dart';

part 'item_details_model.g.dart';

@JsonSerializable()
class ItemDetailsModel {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  @JsonKey(name: 'Total_Available_Quantity')
  final int? availableQuantity;
  final String? code;
  @JsonKey(name: 'base_unit_id')
  final int? unitId;
  @JsonKey(name: 'minimum_stock_level')
  final String? minStockLevel;
  @JsonKey(name: 'maximum_stock_level')
  final String? maxStockLevel;
  @JsonKey(name: 'storage_conditions')
  final String? storageCondition;

  final String? barcode;
  @JsonKey(name: 'supplier_id')
  final int? supplierId;
  @JsonKey(name: 'supplier_name')
  final String? supplierName;
  @JsonKey(name: 'base_unit_name')
  final String? unitName;
  @JsonKey(name: 'selling_price')
  final String? pricePerUnit;

  ItemDetailsModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.availableQuantity,
    this.code,
    this.unitId,
    this.minStockLevel,
    this.maxStockLevel,
    this.storageCondition,
    this.barcode,
    this.supplierId,
    this.supplierName,
    this.unitName,
    this.pricePerUnit,
  });

  factory ItemDetailsModel.fromJson(Map<String,dynamic> json) => _$ItemDetailsModelFromJson(json);


}


