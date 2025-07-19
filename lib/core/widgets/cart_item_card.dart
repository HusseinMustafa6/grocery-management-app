import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:food_managemnet/models/item_models/cart_item_model.dart';
import 'package:get/get.dart';


class CartItemCard extends StatelessWidget {

  final CartItemModel cartItemModel;


  CartItemCard(this.cartItemModel);


  ShoppingCartController cartController = Get.find<ShoppingCartController>();

  RxInt quantity = 0.obs;


  void _changeQuantity(int addedValue){

    if(quantity.value <= 100 && quantity.value  - 1   > 0 ){
      quantity.value += addedValue;
    }
    cartItemModel.quantity = quantity.value.toString();
    cartController.calculateTotalPrice();

    //cartController.updateItemQuantity(cartItemModel);
  }


  Widget _buildQuantityWidget(){
     quantity.value = num.parse(cartItemModel.quantity.toString()).toInt();

     return Container(
      height: 30.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border(top: BorderSide(color: ColorsManager.customGrey,width: 0.8),bottom: BorderSide(color: ColorsManager.customGrey,width: 0.8),left: BorderSide(color: ColorsManager.customGrey,width: 0.8),right: BorderSide(color: ColorsManager.customGrey,width: 0.8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         GestureDetector(
           onTap: (){
                _changeQuantity(1);
           },
           child: Container(
             width: 20.w,
             decoration: BoxDecoration(
               color: Color(0xfff6f6f6),
               borderRadius: BorderRadius.only(topRight: Radius.circular(5.0) ,bottomRight: Radius.circular(5.0)),
               border: Border(left: BorderSide(width: 1.2,color:ColorsManager.customGrey ))
             ),
             child: Center(child: Icon(Icons.add,color: Colors.black,size: 20,),),
           ),
         ),
          Container(
            width: 23.w,
            decoration: BoxDecoration(
                color: Colors.white,
            ),
            child: Center(child: Obx(()=> Text('${quantity.value}',style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Roboto'),))),
          ),
          GestureDetector(
            onTap: (){
              _changeQuantity(-1);

            },
            child: Container(
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0)),
                  color: Color(0xfff6f6f6),
                  border: Border(right: BorderSide(width: 1.2,color:ColorsManager.customGrey ))
              ),
              child: Center(child: Icon(Icons.delete_outline,color: Colors.black,size: 20,) ,),
            ),
          ),
        ],
      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:3,
      margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 7.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/cart_item_pic.png',
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),),
            ),
            SizedBox(width: 8.w),
            Expanded(
              flex: 2,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cart Item Model',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black,fontFamily: 'Roboto'),maxLines:1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 8.h,),
                  Text('Description about this cart item object' ,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54,fontFamily: 'Roboto'),maxLines: 4,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Expanded(child: Text('\$ ${cartItemModel.priceForOne}',style: TextStyle(fontSize: 14,color: Colors.green,fontFamily: 'Roboto' ,fontWeight:FontWeight.w500,),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                    ],
                  )
              
                ],
              ),
            ),
            Column(
              children: [
             IconButton(onPressed: () async{

               //cartController.cartItems.removeWhere((obj)=> obj.itemName == 'TEST PRODUCT');
               final response = await cartController.deleteItemFromCart(cartItemModel.id);
               cartController.cartItems.clear();
               await cartController.getUserCartItems();
                  //cartController.calculateTotalPrice();

               response.fold((errorMsg){
                 EasyLoading.showError(errorMsg.apiErrorModel.message.toString(),dismissOnTap: false,duration: Duration(seconds: 2));
               },
                       (successMsg){
                 EasyLoading.showSuccess(successMsg,duration: Duration(seconds: 2),dismissOnTap: false);
               });


             }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                SizedBox(height: 20.h,),
                _buildQuantityWidget()

              ],
            )
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         groceryItem.itemName.toString(),
            //         style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            //       ),
            //       const SizedBox(height: 8),
            //       Text(
            //         'السعر: \$${groceryItem.itemPrice}',
            //         style: TextStyle(fontSize: 16, color: Colors.green[700]),
            //       ),
            //       const SizedBox(height: 8),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
