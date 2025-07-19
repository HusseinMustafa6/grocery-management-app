import 'package:json_annotation/json_annotation.dart';

part 'item_unit_model.g.dart';


@JsonSerializable()
class ItemUnitModel {

  final int? id;
  @JsonKey(name: 'selling_price')
  final String? sellingPrice;
  @JsonKey(name: 'conversion_factor')
  final String? conversionFactor;

  ItemUnitModel({
    required this.id,
    required this.sellingPrice,
    required this.conversionFactor
});


  factory ItemUnitModel.fromJson(Map<String,dynamic> json) => _$ItemUnitModelFromJson(json);


}