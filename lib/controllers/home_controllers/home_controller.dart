import 'package:food_managemnet/views/home_screens/profile_screen.dart';
import 'package:food_managemnet/views/home_screens/shoping_cart_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../views/home_screens/home_main_screen.dart';

class HomeController extends GetxController{


  RxInt selectedIndex = 0.obs;


  List<Widget> homeWidgets = [
    HomeMainScreen(),
    ShopingCartScreen(),
    ProfileScreen(),
    Center(
      child: Text('Explore'),
    ),
  ];






}