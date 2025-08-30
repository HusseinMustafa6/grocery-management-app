// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      paymentType: json['payment_type'] as String?,
      points: (json['points_used'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      offers: (json['offers'] as List<dynamic>)
          .map((e) => OrderOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'payment_type': instance.paymentType,
      'points_used': instance.points,
      'items': instance.items,
      'offers': instance.offers,
    };

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      cartItemId: (json['cart_item_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'cart_item_id': instance.cartItemId,
      'quantity': instance.quantity,
    };

OrderOfferModel _$OrderOfferModelFromJson(Map<String, dynamic> json) =>
    OrderOfferModel(
      cartOfferId: (json['cart_offer_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderOfferModelToJson(OrderOfferModel instance) =>
    <String, dynamic>{
      'cart_offer_id': instance.cartOfferId,
      'quantity': instance.quantity,
    };
