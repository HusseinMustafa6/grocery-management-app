import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
import 'package:food_managemnet/core/widgets/shopping_cart_widgets/cart_offer_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/widgets/shopping_cart_widgets/cart_item_card.dart';

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


  void showConfirmationDialog(BuildContext context){
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('انتباه',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Roboto' ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('هل تريد ارسال طلب شراء بكلفة : ${controller.totalPrice}  ؟',style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Roboto'),),
              SizedBox(height: 8.h,),
              _buildPaymentTypeWidget()
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('تأكيد',style: TextStyle(color: ColorsManager.customTeal),),
              onPressed: () async{
               final response = await controller.checkOutOrder();
               // showDialog(
               //   context: context,
               //   barrierDismissible: false,
               //   builder: (context) {
               //     return Center(
               //       child: CircularProgressIndicator(
               //         color: ColorsManager.customTeal,
               //       ),
               //     );
               //   },
               // );
               EasyLoading.show(status: 'Loading...',dismissOnTap: false);
               response.fold(
                       (errorMessage){
                         EasyLoading.dismiss();
                         Navigator.of(dialogContext)
                             .pop();

                         EasyLoading.showError(errorMessage.apiErrorModel.message.toString(),duration: Duration(seconds: 2),dismissOnTap: false);
                       },
                       (responseObject){
                         EasyLoading.dismiss();
                         Navigator.of(dialogContext)
                             .pop();
                         if(!responseObject.status!){
                           EasyLoading.showError(responseObject.message.toString(),duration: Duration(seconds: 2),dismissOnTap: false);
                           controller.cartItems.clear();
                           controller.getUserCartItems();
                           return;
                         }

                         EasyLoading.showSuccess(responseObject.message.toString(),duration: Duration(seconds: 2),dismissOnTap: false);
                          controller.cartItems.clear();
                          controller.getUserCartItems();
                       });
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
  }


  Widget _buildPaymentTypeWidget(){
    return Obx(()=> DropdownButton<String>(
        value: controller.selectedPaymentType.value,
        hint: Text('اختر طريقة الدفع',style: TextStyle(fontSize: 15,color: Colors.black54),),
        items: ["cash", "installment"].map((obj)=>DropdownMenuItem(value: obj,child: Text(obj),)).toList(),
        underline: Container(
          height: 1.0,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorsManager.customGrey,
                width: 0.5
              )
            )
          ),
        ),
        onChanged: (value){
          setState(() {
            controller.selectedPaymentType.value = value.toString();
          });
        }));
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
                controller.checkItemsQuantity();
                controller.calculateTotalPrice();
                showConfirmationDialog(context);

              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title:TabBar(
            indicatorColor: ColorsManager.customTeal,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
            tabs: [
              Tab(
                child: Text('المنتجات',
                style: TextStyle(fontSize: 15,color: ColorsManager.customTeal),),
              ),
              Tab(
                child: Text('العروض',
                  style: TextStyle(fontSize: 15,color: ColorsManager.customTeal),),
              )
            ],
          ) ,
        ),
        body: TabBarView(
         children: [
           CustomScrollView(
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
           ),
           CustomScrollView(
             slivers: [
               SliverFillRemaining(
                 hasScrollBody: true,
                 child: Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                     child: Obx(() {
                       if (controller.cartOffers.isNotEmpty) {
                         return AlignedGridView.count(
                           crossAxisCount: 1,
                           itemCount: controller.cartOffers.length,
                           mainAxisSpacing: 8,
                           crossAxisSpacing: 8,
                           shrinkWrap: true,
                           physics: BouncingScrollPhysics(),
                           itemBuilder: (context, index) {
                             return CartOfferCard(controller.cartOffers[index]);
                           },
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
                             'لا يوجد عروض في السلة !',
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
           )
         ],
        ),
      ),
    );
  }
}

/*

 */