import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/widgets/cart_item_card.dart';



class ShopingCartScreen extends StatefulWidget {
  const ShopingCartScreen({super.key});

  @override
  State<ShopingCartScreen> createState() => _ShopingCartScreenState();
}

class _ShopingCartScreenState extends State<ShopingCartScreen> {


  final ShoppingCartController controller = Get.find<ShoppingCartController>();

  @override
  void initState() {
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
       SliverFillRemaining(
         hasScrollBody: true,
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
           child: Obx((){

             if(controller.cartItems.isNotEmpty){

               return AlignedGridView.count(
                 crossAxisCount: 1,
                 itemCount: controller.cartItems.length,
                 mainAxisSpacing: 8,
                 crossAxisSpacing: 8,
                 shrinkWrap: true,
                 physics: BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                   return CartItemCard(controller.cartItems[index]);
                 },
               );


             }else{

               return Center(
                 child:
                 CircularProgressIndicator(
                   color: ColorsManager.customTeal,
                 ),
               );
               return Center(
                 child: Text('لا يوجد منتجات في السلة !',style: TextStyle(
                   fontSize: 15,
                   color: Colors.black54,
                   fontFamily: 'Roboto'
                 ),),
               );
             }



           })


         ),
       )
      ],
    );

  }
}
