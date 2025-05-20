import 'package:flutter/material.dart';
import 'package:food_managemnet/controllers/home_controllers/home_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/profile_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/controllers/login_controller.dart';
import 'package:food_managemnet/controllers/register_controller.dart';
import 'package:food_managemnet/controllers/welcome_controller.dart';
import 'package:food_managemnet/views/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'food_management_app.dart';

void main() {
  initDependencyInjection();
  runApp(const FoodManagementApp());
}


void initDependencyInjection(){

  Get.put(WelcomeController());
  Get.put(RegisterController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ShoppingCartController());
  Get.put(ProfileController());
}