import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';


@JsonSerializable()
class NotificationModel {

  final int? id;
  final String? title;
  @JsonKey(name: 'body')
  final String? content;
  @JsonKey(name: 'created_at')
  final String? date;

  NotificationModel({
    required this.id ,
    required this.title,
   required this.content,
   required this.date
});

  factory NotificationModel.fromJson(Map<String,dynamic> json)=> _$NotificationModelFromJson(json);


}