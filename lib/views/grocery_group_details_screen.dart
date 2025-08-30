import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/category_filter_chip.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/grocery_group_details_controller.dart';
import '../core/widgets/home_widgets/product_tile.dart';


class GroceryGroupDetailsScreen extends StatefulWidget {

  int? groceryGroupID;

  GroceryGroupDetailsScreen(this.groceryGroupID);

  @override
  State<GroceryGroupDetailsScreen> createState() => _GroceryGroupDetailsScreenState();
}

class _GroceryGroupDetailsScreenState extends State<GroceryGroupDetailsScreen> {


  GroceryGroupDetailsController controller = Get.find<GroceryGroupDetailsController>();


  @override
  void initState() {
    controller.items.clear();
    controller.getItemsInCategory(widget.groceryGroupID);
    super.initState();
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
                _buildTitleText('المنتجات في هذا التصنيف:'),
                 SizedBox(height: 18.h,),
                Obx((){

                  if(controller.errorInSubcategories.isFalse){

                    if(controller.subcategories.isNotEmpty){
                      return  SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: controller.subcategories.map((obj)=> CategoryFilterChip(categoryName: obj.groupName.toString()) ).toList() ,//widget.groceryGroup.categories.map((obj)=> CategoryFilterChip(categoryName: obj.toString())).toList(),
                        ),
                      );
                    }else{
                      return SizedBox.shrink();
                    }
                  }
                  return Text('حدث خطأ ما',style: TextStyle(fontSize: 15,color: Colors.black54),);
                }),
                Obx((){

                  if(controller.isLoading.isTrue){
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.customTeal,
                      ),
                    );
                  }else{

                    if(controller.errorInItems.isEmpty){

                      if(controller.items.isNotEmpty){
                        return AlignedGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 16,
                            itemCount: controller.items.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder:(context,index){
                              return ProductTile(controller.items[index]);
                            });
                      }else{
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
                          child: Text('لا يوجد منتجات',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                          ),),
                        );
                      }


                    }else{

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
                        child: Text(controller.errorInItems.value,style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54
                        ),),
                      );

                    }


                  }

                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
