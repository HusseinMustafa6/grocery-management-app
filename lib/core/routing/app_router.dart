


import 'package:flutter/cupertino.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/views/authentication_screens/login_screen.dart';
import 'package:food_managemnet/views/home_screens/home_screen.dart';
import 'package:food_managemnet/views/authentication_screens/register_screen.dart';
import 'package:food_managemnet/views/home_screens/notifications_screen.dart';
import 'package:food_managemnet/views/update_screens/change_password_screen.dart';
import 'package:food_managemnet/views/welcome_screen.dart';
import 'package:get/get.dart';

class AppRouter{


  static Map<String,Widget Function(BuildContext)> routes = {
    Routes.welcomeScreen:(context)=>WelcomeScreen() ,
    Routes.registerScreen:(context)=> RegisterScreen(),
    Routes.loginScreen:(context)=> LoginScreen(),
    Routes.homeScreen:(context)=> HomeScreen(),
    Routes.changePasswordScreen:(context)=> ChangePasswordScreen(),
    Routes.notificationsScreen:(context)=> NotificationsScreen()
  };



}