// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: (json['id'] as num?)?.toInt(),
      cartId: (json['cart_id'] as num?)?.toInt(),
      paymentType: json['payment_type'] as String?,
      status: json['status'] as String?,
      totalPrice: json['total_price'] as String?,
      usedPoint: (json['used_points'] as num?)?.toInt(),
      finalPrice: json['final_price'] as String?,
      qrImagePath: json['qr_code_path'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cart_id': instance.cartId,
      'payment_type': instance.paymentType,
      'status': instance.status,
      'total_price': instance.totalPrice,
      'used_points': instance.usedPoint,
      'final_price': instance.finalPrice,
      'qr_code_path': instance.qrImagePath,
    };
