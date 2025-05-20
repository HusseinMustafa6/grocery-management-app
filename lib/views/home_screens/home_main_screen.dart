

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/grocery_group_tile.dart';
import 'package:food_managemnet/core/widgets/service_card.dart';

import '../../models/grocery_model.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

 
  

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
                 SvgPicture.asset('assets/svgs/rectangle.svg',
                   width: MediaQuery.of(context).size.width,
                   fit: BoxFit.fitWidth,
                 ),
                 SizedBox(height: 24.h,),
                 _buildTitleText('الخدمات:'),
                 SizedBox(height: 16.h,),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: [
                       SizedBox(width: 5.w,),
                       ServiceCard(serviceName: 'الخدمة',icon: Icons.storefront,mainColor:ColorsManager.customCyan ,secondColor: ColorsManager.customLightCyan,),
                       SizedBox(width: 5.w,),
                       ServiceCard(serviceName: 'طلب خاص',icon: Icons.newspaper,mainColor:ColorsManager.customPurple ,secondColor: ColorsManager.customLightPurple,),
                       SizedBox(width: 5.w,),
                       ServiceCard(serviceName: 'الخصومات',icon: Icons.discount_sharp,mainColor:ColorsManager.customYellow ,secondColor: ColorsManager.customLightYellow,),
                       SizedBox(width: 5.w,),
                       ServiceCard(serviceName: 'الخدمة',icon: Icons.storefront,mainColor:ColorsManager.customCyan ,secondColor: ColorsManager.customLightCyan,),
                       SizedBox(width: 5.w,),


                     ],
                   ),
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
              child: Row(
                children: [
                  GroceryGroupTile( groceryGroupModel:GroceryGroupModel( groupName: 'البقوليات', imagePath: 'assets/svgs/beans.svg', categories: ['all','category 1','category 2' ,'category 3','category 4'])),
                  GroceryGroupTile(groceryGroupModel: GroceryGroupModel(groupName: 'الحلويات', imagePath: 'assets/svgs/sweets_sugar.svg', categories: ['all']),),
                  GroceryGroupTile(groceryGroupModel: GroceryGroupModel(groupName: 'المأكولات البحرية', imagePath: 'assets/svgs/sea_food.svg',categories: ['all']),),
                  GroceryGroupTile(groceryGroupModel: GroceryGroupModel(groupName: 'البهارات', imagePath: 'assets/svgs/salt_and_pepper.svg',categories: ['all']),),
                  GroceryGroupTile(groceryGroupModel: GroceryGroupModel(groupName: 'المعلبات', imagePath: 'assets/svgs/canned_food.svg', categories: ['all']),),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
