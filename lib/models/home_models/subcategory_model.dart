import 'package:json_annotation/json_annotation.dart';

part 'subcategory_model.g.dart';

@JsonSerializable()
class SubcategoryModel{
  // this class represent the subcategory

  final int? id;
  @JsonKey(name: 'name')
  final String? groupName;
  final dynamic code;
  //final String? imagePath;
  final String? description;
  @JsonKey(name: 'parent_id')
  final int? parentId;

  final String? type; // category or subcategory
  final String? next; // refers to the children type if it exists.
  @JsonKey(name: 'has_children')
  final bool? hasChildren;


  SubcategoryModel({
    required this.id,
    required this.groupName,
    required this.code,
    required this.description,
    required this.parentId,
    required this.type,
    required this.next,
    required this.hasChildren
  });


  factory SubcategoryModel.fromJson(Map<String,dynamic> json)=> _$SubcategoryModelFromJson(json);



}