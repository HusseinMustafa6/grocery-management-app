import 'package:flutter/material.dart';
import 'package:food_managemnet/controllers/home_controllers/home_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/search_text_field.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';



class HomeScreen extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SearchTextField(searchController: TextEditingController(), hint: 'ابحث عن منتج...'),
        actions: [
          IconButton(
              onPressed: () {
              },
              splashRadius: 20,
              icon: Icon(
                Icons.notifications,
                color: ColorsManager.customTeal,
                size: 33,
              )),
        ],
      ),
      body: Obx(()=>homeController.homeWidgets[homeController.selectedIndex.value]),
      bottomNavigationBar: Obx(()=> StylishBottomBar(
          elevation: 3,
          backgroundColor: Colors.white,
          option: AnimatedBarOptions(
            iconStyle: IconStyle.animated,
            //dotStyle: DotStyle.circle
          ),

         items: [
           BottomBarItem(
               icon: Icon(Icons.home_outlined),
               selectedIcon: Icon(Icons.home),
               selectedColor: ColorsManager.customTeal,
               unSelectedColor: Colors.grey,
               title:  Text('الصفحة الرئيسية',style: TextStyle(fontSize: 14,color: ColorsManager.customTeal,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
               badgePadding: const EdgeInsets.only(left: 4, right: 4),
                ),
           BottomBarItem(
             icon: Icon(Icons.shopping_cart_outlined),
             selectedIcon: Icon(Icons.shopping_cart),
             selectedColor: ColorsManager.customTeal,
             unSelectedColor: Colors.grey,
             title:  Text('المشتريات',style: TextStyle(fontSize: 14,color: ColorsManager.customTeal,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
             badgePadding: const EdgeInsets.only(left: 4, right: 4),
           ),
           BottomBarItem(
             icon: Icon(Icons.person_outlined),
             selectedIcon: Icon(Icons.person),
             selectedColor: ColorsManager.customTeal,
             unSelectedColor: Colors.grey,
             title:  Text('الملف الشخصي',style: TextStyle(fontSize: 14,color: ColorsManager.customTeal,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
             badgePadding: const EdgeInsets.only(left: 4, right: 4),
           ),
           BottomBarItem(
             icon: Icon(Icons.search_outlined),
             selectedIcon: Icon(Icons.search),
             selectedColor: ColorsManager.customTeal,
             unSelectedColor: Colors.grey,
             title:  Text('اكتشاف',style: TextStyle(fontSize: 14,color: ColorsManager.customTeal,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
             badgePadding: const EdgeInsets.only(left: 4, right: 4),
           ),
         ],
         hasNotch: false,
         currentIndex: homeController.selectedIndex.value,
         onTap: (value){
            homeController.selectedIndex.value = value;
         },


      )),
    );
  }
}
