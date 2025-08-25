import 'package:json_annotation/json_annotation.dart';


part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel{

  @JsonKey(name: 'offer_id')
  int? offerId; //"": 1,
  @JsonKey(name: 'discount_type')
  String? offerTitle; //"": "fixed_price",
  @JsonKey(name: 'discount_value')
  String? discountValue; //"": "20.00",
  @JsonKey(name: 'description')
  String? description;// "": "by two with price of one",

  @JsonKey(name: 'starts_at')
  String? startDate;
  @JsonKey(name: 'ends_at')
  String? endDate;
  @JsonKey(name: 'offer_items')
  List<OfferItemModel> offerItems;

  OfferModel({
    required this.offerId,
    required this.offerTitle,
    required this.discountValue,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.offerItems
});

  factory OfferModel.fromJson(Map<String,dynamic> json)=> _$OfferModelFromJson(json);


}

@JsonSerializable()
class OfferItemModel{

  @JsonKey(name: 'offer_item_id')
  int? offerItemId; //"": 1,
  @JsonKey(name: 'original_item_id')
  int? itemId; //"": 1,
  @JsonKey(name: 'required_quantity')
  String? quantity; //"": "1.00",
  @JsonKey(name: 'item')
  String? offerItemTitle; //"": "زيت زيتون بكر ممتاز - عبوة 1cdd",

  OfferItemModel({
   required this.offerItemId,
   required this.itemId,
   required this.quantity,
   required this.offerItemTitle
});

  factory OfferItemModel.fromJson(Map<String,dynamic> json)=> _$OfferItemModelFromJson(json);

}
