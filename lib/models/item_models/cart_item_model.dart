import 'package:food_managemnet/models/item_models/item_unit_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final int? id;
  @JsonKey(name: 'item_unit_id')
  final int? itemUnitId; // will be used for updating the item quantity "": 2,
   String?
      quantity; // represent the default quantity when this item added , usually 1  "quantity": "3.000",
  @JsonKey(name: 'how_many_each_one_has')
  final String? howManyEachOneHas; //"": "4.0000",
  @JsonKey(name: 'selling_price_for_one')
  final String? priceForOne; //"": "5.00",

  CartItemModel(
      {this.id,
      this.itemUnitId,
      this.quantity,
      this.howManyEachOneHas,
      this.priceForOne});


  factory CartItemModel.fromJson(Map<String,dynamic> json)=> _$CartItemModelFromJson(json);

}
