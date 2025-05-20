import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  File? storeLicenseImage;
  late GlobalKey<FormState> formKey;


  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
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



}