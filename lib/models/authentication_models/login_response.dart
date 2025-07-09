import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{

  @JsonKey(name: 'success')
  final bool? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData userData;

  LoginResponse({
   required this.status,
   required this.message,
   required this.userData
});

  factory LoginResponse.fromJson(Map<String,dynamic> json)=> _$LoginResponseFromJson(json);


}

@JsonSerializable()
class UserData{

  final String? token;

  UserData({
    required this.token
});


  factory UserData.fromJson(Map<String,dynamic> json)=>_$UserDataFromJson(json);


}
