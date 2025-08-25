import 'package:json_annotation/json_annotation.dart';

part 'item_unit_model.g.dart';

@JsonSerializable()
class ItemUnitsModel{

  @JsonKey(name: 'data')
  List<ItemUnitModel> units;

  ItemUnitsModel({required this.units});


  factory ItemUnitsModel.fromJson(Map<String,dynamic> json)=> _$ItemUnitsModelFromJson(json);

}


@JsonSerializable()
class ItemUnitModel {

  final int? id;
  @JsonKey(name: 'selling_price')
  final String? sellingPrice;
  @JsonKey(name: 'conversion_factor')
  final String? conversionFactor;
  @JsonKey(name: 'unit_id')
  final int? unitId; //"": 1,
  ItemUnitModel({
    required this.id,
    required this.sellingPrice,
    required this.conversionFactor,
    required this.unitId
});


  factory ItemUnitModel.fromJson(Map<String,dynamic> json) => _$ItemUnitModelFromJson(json);


}