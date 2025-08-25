import 'package:json_annotation/json_annotation.dart';

part 'unit_model.g.dart';


@JsonSerializable()
class UnitModel{

  int? id; //"id": 2,
  String? name; //"name": "Unit 2",
  String? type; //"type": "volume"

  UnitModel({
   required this.id,
   required this.name,
   required this.type
});

  factory UnitModel.fromJson(Map<String,dynamic> json)=> _$UnitModelFromJson(json);

}