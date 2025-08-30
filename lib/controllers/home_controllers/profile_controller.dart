import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  // this controller will handle get profile data & update profile info and change user password

  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  File? testImage; // to handle profile image
  RxBool enableEdit = false.obs;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController newPasswordConfirmationController;
  late GlobalKey<FormState> passwordFormKey;
  late ProfileService profileService;
  RxBool showOldPassword = false.obs;
  RxBool showNewPassword = false.obs;


  @override
  void onInit() {
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();

    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    newPasswordConfirmationController = TextEditingController();
    passwordFormKey = GlobalKey<FormState>();
    profileService = ProfileService(Get.find());
  }


  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  void getData(){

  }
  
  
  Future<Either<ErrorHandler,String>> changeUserPassword({required String oldPassword ,
    required String newPassword,
    required String newPasswordConfirmation
  })async{
    
    try{
      final response = await profileService.changeUserPassword(oldPassword: oldPassword, newPassword: newPassword, newPasswordConfirmation: newPasswordConfirmation);
      
      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }
    
    
  }


  Future<Either<ErrorHandler,Map<String,dynamic>>> getUserProfile()async{


    try{
      final response = await profileService.getUserProfile();


      print(response['name']!);

      userNameController.text = response['name']!;
      emailController.text = response['email']!;
      phoneController.text = response['customer']['phone_number']!;
      return Right(response);
    }catch(error){
     return Left(ErrorHandler.handle(error));
    }
  }
  
  




}