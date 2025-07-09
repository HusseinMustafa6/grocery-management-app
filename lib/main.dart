import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_managemnet/controllers/home_controllers/home_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/home_main_screen_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/notifications_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/profile_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/controllers/login_controller.dart';
import 'package:food_managemnet/controllers/register_controller.dart';
import 'package:food_managemnet/controllers/welcome_controller.dart';
import 'package:food_managemnet/core/networking/dio_factory.dart';
import 'package:food_managemnet/views/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controllers/grocery_group_details_controller.dart';
import 'food_management_app.dart';

void main() {
  initDependencyInjection();
  runApp(const FoodManagementApp());
}


void initDependencyInjection(){

  Dio dio = DioFactory.getDio();
  Get.put(dio);

  Get.put(WelcomeController());
  Get.put(RegisterController());
  Get.put(HomeController());
  Get.put(LoginController());
  Get.put(ShoppingCartController());
  Get.put(ProfileController());
  Get.lazyPut(()=>HomeMainScreenController());
  Get.lazyPut(()=>GroceryGroupDetailsController());
  Get.put(NotificationsController());

}

/*
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Global controller (auth, theme)
    Get.put<AuthController>(AuthController());

    // Other page-specific controllers
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingsController());
  }
}

 */