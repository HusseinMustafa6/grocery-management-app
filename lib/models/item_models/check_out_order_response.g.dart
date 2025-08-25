// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutOrderResponse _$CheckOutOrderResponseFromJson(
        Map<String, dynamic> json) =>
    CheckOutOrderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CheckOutOrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckOutOrderResponseToJson(
        CheckOutOrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CheckOutOrderData _$CheckOutOrderDataFromJson(Map<String, dynamic> json) =>
    CheckOutOrderData(
      paymentType: json['payment_type'] as String?,
      totalPrice: json['total_price'] as String?,
      finalPrice: (json['final_price'] as num?)?.toInt(),
      usedPoint: (json['used_points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckOutOrderDataToJson(CheckOutOrderData instance) =>
    <String, dynamic>{
      'payment_type': instance.paymentType,
      'total_price': instance.totalPrice,
      'final_price': instance.finalPrice,
      'used_points': instance.usedPoint,
    };
