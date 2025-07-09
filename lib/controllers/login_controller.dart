import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/authentication_models/login_request.dart';
import 'package:food_managemnet/models/authentication_models/login_response.dart';
import 'package:food_managemnet/services/authentication_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  late AuthenticationService service;

  RxBool showPassword = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    service = AuthenticationService(Get.find());
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
  }


  Future<Either<ErrorHandler,LoginResponse>> login()async{
    // if we reached this function , that's mean that the email is valid and password is valid
    LoginRequest request = LoginRequest(email: nameController.text, password: passwordController.text);
    try{

    final response = await service.login(request);
      print('response in controller ${response}');
     return Right(response);
    }catch(error){
     return Left(ErrorHandler.handle(error));
    }

  }



}