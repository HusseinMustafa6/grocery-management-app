import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/home_main_screen_controller.dart';
import 'package:food_managemnet/controllers/home_controllers/shopping_cart_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../models/offer_models/offer_model.dart';


class OfferCard extends StatelessWidget {

  OfferModel offerModel;


  OfferCard(this.offerModel);



 void addOfferToCart(BuildContext context){

   final controller = Get.find<HomeMainScreenController>();

   showDialog(context: context,
     builder: (ctx){
       return AlertDialog(
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text('هل تريد اضافة هذا العرض إلى سلة الشراء الخاصة بك ؟',style: TextStyle(fontSize: 15,color: Colors.black54,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
             SizedBox(height: 12.h,),
           ],
         ),
         actions: [TextButton(onPressed: ()async{
           Navigator.pop(context);

           final response = await controller.addOfferToCart(offerId: offerModel.offerId,
               quantity: 1);

           response.fold((error){
             EasyLoading.showError(error.apiErrorModel.message.toString(),dismissOnTap: false,duration: Duration(seconds: 2));
           },(status){
             if(status){
             EasyLoading.showSuccess('تمت العملية بنجاح',duration: Duration(seconds: 2),dismissOnTap: false);
             }else{
             EasyLoading.showError('Server Error',dismissOnTap: true,duration: Duration(seconds: 2));
             }
           });

         }, child: Text('تأكيد',style: TextStyle(fontSize: 15,color: ColorsManager.customTeal,fontFamily: 'Roboto',fontWeight: FontWeight.w600),))],
       ) ;
     },);
 }



  Widget _buildOfferItemText(String itemName){
    return Row(
      children: [
        Expanded(
          child: Text(itemName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto'
          ),),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 200.w,
      child: Banner(
        message: '% ${offerModel.discountValue} OFF',
        color: ColorsManager.customTeal,
        location: BannerLocation.topEnd,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 10.w
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(offerModel.offerTitle.toString() ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.customTeal,
                        fontFamily: 'Roboto'
                      ),),
                    ),

                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(offerModel.description.toString() ,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Roboto'
                      ),),
                    ),

                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(offerModel.startDate.toString(),style: TextStyle(fontSize: 15,color: ColorsManager.customTeal),),
                    Text(offerModel.endDate.toString(),style: TextStyle(fontSize: 15,color: ColorsManager.customTeal),)
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Text('يحتوي على :',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.customTeal,
                          fontFamily: 'Roboto'
                      ),),

                  ],
                ),
                SizedBox(height: 5.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: offerModel.offerItems.map((item)=>_buildOfferItemText(item.offerItemTitle.toString())).toList(),
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

                           addOfferToCart(context);

                        }, child: Icon(Icons.add_shopping_cart,color: Colors.white,)),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
