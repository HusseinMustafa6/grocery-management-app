import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/widgets/category_filter_chip.dart';
import 'package:food_managemnet/models/grocery_model.dart';


class GroceryGroupDetailsScreen extends StatefulWidget {

  GroceryGroupModel groceryGroup;

  GroceryGroupDetailsScreen(this.groceryGroup);

  @override
  State<GroceryGroupDetailsScreen> createState() => _GroceryGroupDetailsScreenState();
}

class _GroceryGroupDetailsScreenState extends State<GroceryGroupDetailsScreen> {




  Widget _buildTitleText(String title){
    return Row(
      children: [
        Text(title,style: TextStyle(fontSize: 18,color: Colors.black),)
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        title: Text('GROCERY GROUP',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText('المجموعات الغذائية:'),
                 SizedBox(height: 18.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.groceryGroup.categories.map((obj)=> CategoryFilterChip(categoryName: obj.toString())).toList(),
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
