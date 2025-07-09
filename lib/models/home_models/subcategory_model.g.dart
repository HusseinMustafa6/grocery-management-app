// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) =>
    SubcategoryModel(
      id: (json['id'] as num?)?.toInt(),
      groupName: json['name'] as String?,
      code: json['code'],
      description: json['description'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      next: json['next'] as String?,
      hasChildren: json['has_children'] as bool?,
    );

Map<String, dynamic> _$SubcategoryModelToJson(SubcategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.groupName,
      'code': instance.code,
      'description': instance.description,
      'parent_id': instance.parentId,
      'type': instance.type,
      'next': instance.next,
      'has_children': instance.hasChildren,
    };
