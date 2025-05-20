import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:get/get.dart';

class CategoryFilterChip extends StatelessWidget {

  final String categoryName;
  RxBool isSelected = false.obs;


  CategoryFilterChip({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> GestureDetector(
      onTap: (){
        isSelected.toggle();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected.isTrue ? ColorsManager.customTeal:Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(categoryName,style: TextStyle(fontSize: 14,color: isSelected.isTrue ? Colors.white :Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),


      ),
    ));
  }
}
