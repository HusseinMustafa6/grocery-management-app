import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse{

  // @JsonKey(name: 'success')
  // final bool? status;
  // final String? message;
  // @JsonKey(name: 'data')
  // final UserData userData;

  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phone;


  RegisterResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone
  });

  factory RegisterResponse.fromJson(Map<String,dynamic> json)=> _$RegisterResponseFromJson(json);


}

@JsonSerializable()
class UserData{

  final String? token;

  UserData({
    required this.token
  });


  factory UserData.fromJson(Map<String,dynamic> json)=>_$UserDataFromJson(json);


}
