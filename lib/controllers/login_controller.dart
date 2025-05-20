import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  RxBool showPassword = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
  }

}