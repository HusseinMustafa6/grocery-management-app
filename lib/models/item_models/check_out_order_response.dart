import 'package:json_annotation/json_annotation.dart';

part 'check_out_order_response.g.dart';


@JsonSerializable()
class CheckOutOrderResponse {

  bool? status;
  String? message;
  CheckOutOrderData? data;

  CheckOutOrderResponse({
   required this.status,
   required this.message,
   required this.data
});

  factory CheckOutOrderResponse.fromJson(Map<String,dynamic> json)=> _$CheckOutOrderResponseFromJson(json);


}

@JsonSerializable()
class CheckOutOrderData {

  @JsonKey(name: 'payment_type')
  String? paymentType; // cash",
  @JsonKey(name: 'total_price')
  String? totalPrice;//"": "15.00",
  @JsonKey(name: 'final_price')
  int? finalPrice; //"final_price": 13,
  @JsonKey(name: 'used_points')
  int? usedPoint; //"": 1,

  CheckOutOrderData({
    required this.paymentType,
    required this.totalPrice,
    required this.finalPrice,
    required this.usedPoint
});

  factory CheckOutOrderData.fromJson(Map<String,dynamic> json)=> _$CheckOutOrderDataFromJson(json);


}