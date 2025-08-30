import 'package:json_annotation/json_annotation.dart';


part 'upcoming_payment_model.g.dart';

@JsonSerializable()
class UpcomingPaymentModel{

  int? id;//"id": 10,
  @JsonKey(name: 'order_id')
  int? orderId; //"order_id": 1,
  @JsonKey(name: 'paid_amount')
  String? paidAmount; //"paid_amount": "760.00",
  @JsonKey(name: 'remaining_amount')
  String? remainingAmount;// "remaining_amount": "2275.00",
  @JsonKey(name: 'due_date')
  String? dueDate; //"due_date": "2025-09-04",

  UpcomingPaymentModel({
    required this.id,
    required this.orderId,
    required this.paidAmount,
    required this.remainingAmount,
    required this.dueDate
});


  factory UpcomingPaymentModel.fromJson(Map<String,dynamic> json)=> _$UpcomingPaymentModelFromJson(json);


}