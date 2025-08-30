import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ProductTile extends StatelessWidget {

  final ProductModel product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.itemDetailsScreen,arguments: product.id);
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
                color: ColorsManager.customTeal,
                width: 1.2
            )
        ),
        child: Column(
          children: [

            Container(

               clipBehavior: Clip.antiAlias,
               decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0) ,topRight: Radius.circular(10.0)),
         ),
              child: product.image == null ? Image.asset('assets/images/meal_logo.png',fit: BoxFit.fitWidth,):Image.network(ApiConstants.imageBaseUrl +'storage/'+product.image.toString(),fit: BoxFit.fitWidth,),
            ) ,
            SizedBox(height: 12.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(child: Text(product.name.toString(),textAlign:TextAlign.center, style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                ],
              ),
            ),
            SizedBox(height: 7.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(child: Text('',textAlign:TextAlign.start, style: TextStyle(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),maxLines: 4,overflow: TextOverflow.ellipsis,)),
                ],
              ),
            ),
            SizedBox(height: 7.h,),
            Container(
              width: 50.w,
              height: 30.h,
              margin: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
              child: Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ColorsManager.customTeal),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(5),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.itemDetailsScreen,arguments: product.id);

                      //   GroceryItem item = GroceryItem(itemName: product.name, itemDescription: 'TEST', imagePath: 'assets/images/cart_item_pic.png', itemPrice: 100.00);
                   //
                   //   ShoppingCartController cartController = Get.find<ShoppingCartController>();
                   //
                   //   bool isAlreadyExists = false;
                   //   for(GroceryItem temp in cartController.cartItems){
                   //     if(temp.itemName == item.itemName){
                   //       isAlreadyExists = true;
                   //     }
                   //   }
                   //
                   //   if(isAlreadyExists){
                   //     ScaffoldMessenger.of(context).showSnackBar(
                   //       SnackBar(content: Text('المنتج موجود في سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.red,)
                   //     );
                   //
                   //   }else{
                   //     cartController.cartItems.add(item);
                   //     ScaffoldMessenger.of(context).showSnackBar(
                   //         SnackBar(content: Text('تمت اضافة المنتج إلى سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.green,)
                   //     );
                   //   }
                   // cartController.calculateTotalPrice();
                }, child: Icon(Icons.add_shopping_cart,color: Colors.white,)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
