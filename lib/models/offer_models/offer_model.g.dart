// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      offerId: (json['offer_id'] as num?)?.toInt(),
      offerTitle: json['discount_type'] as String?,
      discountValue: (json['discount_value'] as num?)?.toInt(),
      description: json['description'] as String?,
      startDate: json['starts_at'] as String?,
      endDate: json['ends_at'] as String?,
      offerItems: (json['offer_items'] as List<dynamic>)
          .map((e) => OfferItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'offer_id': instance.offerId,
      'discount_type': instance.offerTitle,
      'discount_value': instance.discountValue,
      'description': instance.description,
      'starts_at': instance.startDate,
      'ends_at': instance.endDate,
      'offer_items': instance.offerItems,
    };

OfferItemModel _$OfferItemModelFromJson(Map<String, dynamic> json) =>
    OfferItemModel(
      offerItemId: (json['offer_item_id'] as num?)?.toInt(),
      itemId: (json['original_item_id'] as num?)?.toInt(),
      quantity: json['required_quantity'] as String?,
      offerItemTitle: json['item'] as String?,
    );

Map<String, dynamic> _$OfferItemModelToJson(OfferItemModel instance) =>
    <String, dynamic>{
      'offer_item_id': instance.offerItemId,
      'original_item_id': instance.itemId,
      'required_quantity': instance.quantity,
      'item': instance.offerItemTitle,
    };
