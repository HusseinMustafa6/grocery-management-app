import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/home_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/home_main_screen_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/notifications_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/search_text_field.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';



class HomeScreen extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>();



  Widget buildDivider(){
    return SizedBox(
      width: 100.w,
      child: Divider(
        thickness: 1,
        color: ColorsManager.customGrey,
      ),
    );
  }

  Widget buildDrawerTile(IconData iconData , String title ,VoidCallback onTap){
    return ListTile(
      onTap: onTap,
      leading: Icon(iconData,color: ColorsManager.customTeal ,size: 23,),
      title: Text(title,style: TextStyle(fontSize: 16),),
    );
  }

  Widget buildDrawerContent(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(height: 100.h,),
               buildDrawerTile(Icons.list_rounded,'الطلبات المعلقة', () {
                 Navigator.pushNamed(context, Routes.ordersScreen);
               }),
               buildDivider(),

               buildDrawerTile(Icons.list_alt,'الطلبات الجاهزة', () {
                 Navigator.pushNamed(context, Routes.activeOrdersScreen);
               }),
               buildDivider(),
               buildDrawerTile(Icons.calculate_sharp,'الفواتير', () {
                 Navigator.pushNamed(context, Routes.upComingPayments);
               }),
               buildDivider(),
               buildDrawerTile(Icons.add_box_rounded,'تقديم اقتراح', () {
                 Navigator.pushNamed(context, Routes.addNewItemPropositionScreen);
               }),
               buildDivider(),
                  Spacer(),
               GestureDetector(
                onTap: (){

                 EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.chasingDots;
                 EasyLoading.show(status: 'جاري تسجيل الخروج..',dismissOnTap: true,);
                 Future.delayed(Duration(seconds: 2),(){
                   EasyLoading.dismiss();
                   Navigator.pushNamed(context,Routes.loginScreen);
                 });

                },
                child: Container(
                  width: MediaQuery.of(context).size.width *0.6,
                  height: 50.h,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تسجيل خروج",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: ColorsManager.customTeal,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(height: 50.h,),

            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: ColorsManager.customTeal
        ),
        elevation: 0,
        title: SearchTextField(searchController: TextEditingController(), hint: 'ابحث عن منتج...'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.notificationsScreen);

                NotificationsController controller = Get.find<NotificationsController>();
                controller.notifications.clear();
                controller.getUserNotifications();
              },
              splashRadius: 20,
              icon: Icon(
                Icons.notifications,
                color: ColorsManager.customTeal,
                size: 33,
              )),
        ],
      ),
      drawer: buildDrawerContent(context),
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
           if(value == 1){
              ShoppingCartController controller = Get.find<ShoppingCartController>();
              controller.cartItems.clear();
              controller.cartOffers.clear();
              controller.getUserCartItems();
            }
           if(value == 0){
             HomeMainScreenController controller = Get.find<HomeMainScreenController>();
             controller.allOffers.clear();
             controller.allItems.clear();
             controller.categories.clear();
             controller.getGroceryGroupsCategories();
             controller.getAllItems();
             controller.getUserPoints();
             controller.getAllOffers();
           }
         },


      )),
    );
  }
}
