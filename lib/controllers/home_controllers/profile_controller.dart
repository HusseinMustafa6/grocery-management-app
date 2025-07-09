import 'dart:io';
import 'package:flutter/cupertino.dart';
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

  }


  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  void getData(){
    Future.delayed(Duration(seconds: 3),(){
      userNameController.text = 'مستخدم تجريبي';
      phoneController.text = '963965442879';
      emailController.text = 'testUser@gmail.com';
    });

  }




}