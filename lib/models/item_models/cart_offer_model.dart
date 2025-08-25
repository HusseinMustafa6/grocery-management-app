import 'package:json_annotation/json_annotation.dart';

part 'cart_offer_model.g.dart';

@JsonSerializable()
class CartOfferModel{

    // this id will be used for confirm the order
    @JsonKey(name: 'id')
    int? cartOfferId;
    @JsonKey(name: 'quantity')
    String? quantity;
    @JsonKey(name: 'offer')
    CartOfferData data;

    CartOfferModel({
    required this.cartOfferId,
    required this.quantity,
    required this.data
});

  factory CartOfferModel.fromJson(Map<String,dynamic> json)=> _$CartOfferModelFromJson(json);

}

@JsonSerializable()
class CartOfferData {

    @JsonKey(name: 'offer_id')
    int? offerId; //"": 1,
    @JsonKey(name: 'discount_type')
    String? offerTitle; //"discount_type": "fixed_price",
    @JsonKey(name: 'discount_value')
    String? discountValue; //  "discount_value": "25.00",
    @JsonKey(name: 'description')
    String? description; //"description": null,
    @JsonKey(name: 'starts_at')
    String? startDate; //"": "2025-08-07",
    @JsonKey(name: 'ends_at')
    String? endDate; // "ends_at": "2025-09-01",

    CartOfferData({
   required this.offerId,
   required this.offerTitle,
   required this.description,
   required this.discountValue,
   required this.startDate,
   required this.endDate
});


  factory CartOfferData.fromJson(Map<String,dynamic> json)=> _$CartOfferDataFromJson(json);


}