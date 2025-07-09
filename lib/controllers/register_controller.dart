import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/models/authentication_models/register_request.dart';
import 'package:food_managemnet/models/authentication_models/register_response.dart';
import 'package:food_managemnet/services/authentication_service.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  late AuthenticationService service;

  File? storeLicenseImage;
  late GlobalKey<FormState> formKey;

  RxBool showPassword = false.obs;


  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    service = AuthenticationService(Get.find());
    formKey = GlobalKey<FormState>();
    super.onInit();
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }




  void goToHomeScreen(){
    Get.offAllNamed(Routes.homeScreen);
  }


  Future<Either<ErrorHandler,RegisterResponse>> register(File? certificate )async{

    RegisterRequest request = RegisterRequest(name: nameController.text,
        email: emailController.text, phoneNumber: passwordController.text,
        commercialCertificate: certificate);

    try{
      final response = await service.register(request);

      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }



  }





}