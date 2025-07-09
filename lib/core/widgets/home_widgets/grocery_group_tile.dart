import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/views/grocery_group_details_screen.dart';


class GroceryGroupTile extends StatelessWidget {

  // will handle get categories API


  final GroceryGroupModel groceryGroupModel;


  GroceryGroupTile({
    required this.groceryGroupModel
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return GroceryGroupDetailsScreen(groceryGroupModel.id);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset( groceryGroupModel.groupName.toString() == 'category 3 test' ? 'assets/svgs/canned_food.svg':'assets/svgs/salt_and_pepper.svg',
            width: 24.w,height:24.h ,
            ),
            SizedBox(height: 5.h,),
            Text(groceryGroupModel.groupName!.length > 22 ? '${groceryGroupModel.groupName!.substring(0,22)}..':groceryGroupModel.groupName!,style: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: 'Roboto'),)
          ],
        ),
      ),
    );
  }
}
