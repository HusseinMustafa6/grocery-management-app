import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

// this model class will represent the item

@JsonSerializable()
class ProductModel {

  final int? id;
  final String? name;
  final String? image;


  ProductModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String,dynamic> json) => _$ProductModelFromJson(json);




}