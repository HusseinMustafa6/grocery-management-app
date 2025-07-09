import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
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
    // controller.getData();
  }

  Widget _buildCheckOutWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              'السعر الكلي: ${controller.totalPrice} \$',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto'),
            ),
          ),
          CustomButton(
              buttonWidth: 50.w,
              buttonHeight: 25.h,
              horizontalPadding: 5.w,
              verticalPadding: 6.h,
              buttonText: 'شراء',
              textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('انتباه',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Roboto' ),),
                      content: Text('هل تريد ارسال طلب شراء بكلفة : ${controller.totalPrice}  ؟',style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Roboto'),),
                      actions: <Widget>[
                        TextButton(
                          child: Text('تأكيد',style: TextStyle(color: ColorsManager.customTeal),),
                          onPressed: () {

                          },
                        ),
                        TextButton(
                          child: Text('إلغاء',style: TextStyle(color: Colors.red),),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Obx(() {
                if (controller.cartItems.isNotEmpty) {
                  return Stack(
                    children: [
                      AlignedGridView.count(
                        crossAxisCount: 1,
                        itemCount: controller.cartItems.length,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CartItemCard(controller.cartItems[index]);
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _buildCheckOutWidget(context),
                      )
                    ],
                  );
                } else {
                  // return Center(
                  //   child:
                  //   CircularProgressIndicator(
                  //     color: ColorsManager.customTeal,
                  //   ),
                  // );
                  return Center(
                    child: Text(
                      'لا يوجد منتجات في السلة !',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontFamily: 'Roboto'),
                    ),
                  );
                }
              })),
        )
      ],
    );
  }
}
