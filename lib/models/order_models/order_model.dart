import 'package:json_annotation/json_annotation.dart';


part 'order_model.g.dart';


@JsonSerializable()
class OrderModel {

  int? id; // 3,
  @JsonKey(name: 'cart_id')
  int? cartId; //"": 1,
  @JsonKey(name: 'payment_type')
  String? paymentType;//"": "cash",
  @JsonKey(name: 'status')
  String? status; //"": "pending",
  @JsonKey(name: 'total_price')
  String? totalPrice; // "": "100.00",
  @JsonKey(name: 'used_points')
  int? usedPoint; //"": 0,
  @JsonKey(name: 'final_price')
  String? finalPrice;//"": "100.00",
  @JsonKey(name: 'qr_code_path')
  String? qrImagePath;//"": "qrcodes/order_3.png"

  OrderModel({
   required this.id,
   required this.cartId,
   required this.paymentType,
   required this.status,
   required this.totalPrice,
   required this.usedPoint,
   required this.finalPrice,
   required this.qrImagePath
});

  factory OrderModel.fromJson(Map<String,dynamic> json)=> _$OrderModelFromJson(json);


}