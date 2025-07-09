



import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/authentication_models/login_request.dart';
import 'package:food_managemnet/models/authentication_models/login_response.dart';
import 'package:food_managemnet/models/authentication_models/register_request.dart';
import 'package:food_managemnet/models/authentication_models/register_response.dart';

class AuthenticationService {

  Dio dio;

  AuthenticationService(this.dio);


  Future<LoginResponse> login(LoginRequest request)async{
    String url = ApiConstants.baseUrl + ApiConstants.loginUrl;

    try{

      Response response = await dio.post(url,data: request.toJson());


      return LoginResponse.fromJson(response.data);
    }catch(error){
      rethrow;
    }




  }


  Future<RegisterResponse> register(RegisterRequest request)async{

    String url = ApiConstants.baseUrl + ApiConstants.registerUrl;

    try{

     FormData formData = FormData.fromMap({
       'name':request.name,
       'email':request.email,
       'phone_number':request.phoneNumber,
       'commercial_certificate': await MultipartFile.fromFile(request.commercialCertificate!.path)
     });

    Response response = await dio.post(url,data: formData);

    return RegisterResponse.fromJson(response.data);
    }catch(error){
      rethrow;
    }
  }




}