// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartOfferModel _$CartOfferModelFromJson(Map<String, dynamic> json) =>
    CartOfferModel(
      cartOfferId: (json['id'] as num?)?.toInt(),
      quantity: json['quantity'] as String?,
      data: CartOfferData.fromJson(json['offer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartOfferModelToJson(CartOfferModel instance) =>
    <String, dynamic>{
      'id': instance.cartOfferId,
      'quantity': instance.quantity,
      'offer': instance.data,
    };

CartOfferData _$CartOfferDataFromJson(Map<String, dynamic> json) =>
    CartOfferData(
      offerId: (json['offer_id'] as num?)?.toInt(),
      offerTitle: json['discount_type'] as String?,
      description: json['description'] as String?,
      discountValue: json['discount_value'] as String?,
      startDate: json['starts_at'] as String?,
      endDate: json['ends_at'] as String?,
    );

Map<String, dynamic> _$CartOfferDataToJson(CartOfferData instance) =>
    <String, dynamic>{
      'offer_id': instance.offerId,
      'discount_type': instance.offerTitle,
      'discount_value': instance.discountValue,
      'description': instance.description,
      'starts_at': instance.startDate,
      'ends_at': instance.endDate,
    };
