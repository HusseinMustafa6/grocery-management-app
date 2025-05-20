import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';




class ServiceCard extends StatelessWidget {

   final String? serviceName;
   final IconData icon;
   final Color mainColor;
   final Color secondColor;
   ServiceCard({required this.serviceName ,required this.icon, required this.mainColor, required this.secondColor});

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 115.w,
      height: 115.h,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border(top: BorderSide(width: 1.5,color:mainColor, ),bottom: BorderSide(width: 1.5,color:mainColor, ),
        left: BorderSide(width: 1.5,color:mainColor, ),right: BorderSide(width: 1.5,color:mainColor, ),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                height: 38.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: mainColor
                ),
                child: Icon(icon,color: secondColor,),
              )

            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(serviceName.toString(),style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),)
              ],
            ),
          )
        ],
      ),
    );


  }



}
