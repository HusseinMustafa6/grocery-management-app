import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';


@JsonSerializable()
class RegisterRequest{

  final String? name;
  final String? email;
  // final String? password;
  // @JsonKey(name: 'confirm_password')
  // final String? passwordConfirmation;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'commercial_certificate')
  @FileConverter()
  final File? commercialCertificate;


  RegisterRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.commercialCertificate
});

  Map<String,dynamic> toJson()=> _$RegisterRequestToJson(this);



}


class FileConverter implements JsonConverter<File?,String?>{

  const FileConverter();

  @override
  File? fromJson(String? path) {
    return path == null ? null :File(path);
  }

  @override
  String? toJson(File? file) {
    return file?.path;
  }

}
