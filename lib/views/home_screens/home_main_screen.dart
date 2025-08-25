

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_managemnet/controllers/home_controllers/home_main_screen_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/home_widgets/grocery_group_tile.dart';
import 'package:food_managemnet/core/widgets/home_widgets/product_tile.dart';
import 'package:food_managemnet/core/widgets/offer_widgets/offer_card.dart';
import 'package:food_managemnet/core/widgets/service_card.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../models/home_models/grocery_model.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

 

  HomeMainScreenController controller = Get.find<HomeMainScreenController>();



  Widget _buildPointsWidget(){
    return Obx(()=> Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 2,color: Colors.white30)
            ),
            child: Text('Your Points : ${controller.userPoints.value}',style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto'
            ),),
          ),
        ),
      ),
    ));
  }




  Widget _buildHorizontalDivider(double width,double thickness){
    return SizedBox(
      width: width,
      child: Divider(
        thickness: thickness,
        color: Colors.grey,
      ),
    );
  }


  Widget _buildTitleText(String title){
    return Row(
      children: [
         Text(title,style: TextStyle(fontSize: 18,color: Colors.black),)
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h
        ),
        child: Column(
          children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 10.w),
             child: Column(
               children: [
                 Stack(
                   alignment: Alignment.center,
                   children: [
                     SvgPicture.asset('assets/svgs/rectangle.svg',
                       width: MediaQuery.of(context).size.width,
                       fit: BoxFit.fitWidth,
                     ),
                     _buildPointsWidget()
                   ],
                 ),

                 SizedBox(height: 24.h,),
                 _buildTitleText('العروض:'),
                 SizedBox(height: 16.h,),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Obx((){

                     if(controller.offersLoading.isTrue){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 18.h),
                        child: CircularProgressIndicator(
                          color: ColorsManager.customTeal,
                        ),
                      );
                     }else{

                       if(controller.offersStatus.isTrue){

                        if(controller.allOffers.isNotEmpty){
                          return Row(
                            children: controller.allOffers.map((obj)=> OfferCard(obj)).toList(),
                          );
                        }else{
                          return Row(
                            children: [
                              Text('لا يوجد عروض خاصة',style: TextStyle(fontSize: 16,color: Colors.black54),)
                            ],
                          );
                        }
                       }else{
                         return Row(
                           children: [
                             Text('Server Error',style: TextStyle(fontSize: 16,color: Colors.black54),)
                           ],
                         );
                       }

                     }

                   })
                 ),
                 SizedBox(height: 24.h,),
                 _buildTitleText('المجموعات الغذائية:'),
                 SizedBox(height: 16.h,),
               ],
             ),
           ) ,

            _buildHorizontalDivider(MediaQuery.of(context).size.width,1),
            SizedBox(height: 20.h,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(()=>  controller.errorInCategories.isFalse ? Row(
                children: controller.categories.isNotEmpty ? controller.categories.map((category)=> GroceryGroupTile(groceryGroupModel: category)).toList() : [
                  Text('لا يوجد مجموعات غذائية',style: TextStyle(fontSize: 15,color: Colors.black54),)
                ],
              ): Text('حدث خطأ ما',style: TextStyle(fontSize: 15,color: Colors.black54),))
            ),
            _buildHorizontalDivider(MediaQuery.of(context).size.width,1),
            SizedBox(height: 20.h),
            Obx((){

              if(controller.errorInAllItems.isFalse){

                if(controller.allItems.isNotEmpty){
                  return AlignedGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      itemCount: controller.allItems.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder:(context,index){
                        return ProductTile(controller.allItems[index]);
                      });
                }else{
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text('لا يوجد منتجات ليتم عرضها',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  );
                }

              }else{
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(controller.errorMessageInAllItems.toString(),style: TextStyle(fontSize: 15,color: Colors.black54),),
                );
              }


            }),



          ],
        ),
      ),
    );
  }
}
