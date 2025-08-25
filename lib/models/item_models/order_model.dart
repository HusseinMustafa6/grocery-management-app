import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {

  @JsonKey(name: 'payment_type')
  String? paymentType;
  @JsonKey(name: 'points_used')
  int? points;
  @JsonKey(includeToJson: true)
  List<OrderItemModel> items;

  OrderModel({
   required this.paymentType,
   required this.points,
   required this.items
});


  Map<String,dynamic> toJson()=> _$OrderModelToJson(this);


}

@JsonSerializable()
class OrderItemModel {

  @JsonKey(name: 'cart_item_id')
  int? cartItemId;
  int? quantity;

  OrderItemModel({
    required this.cartItemId,
    required this.quantity
});


  OrderItemModel.fromJson(Map<String,dynamic> json){}

  Map<String,dynamic> toJson()=> _$OrderItemModelToJson(this);

}



