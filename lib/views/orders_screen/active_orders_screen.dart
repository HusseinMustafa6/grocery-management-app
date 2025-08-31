import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/orders_controller.dart';
import '../../core/theming/colors_manager.dart';
import '../../core/widgets/orders_widgets/order_card.dart';

class ActiveOrdersScreen extends StatefulWidget {
  const ActiveOrdersScreen({super.key});

  @override
  State<ActiveOrdersScreen> createState() => _ActiveOrdersScreenState();
}

class _ActiveOrdersScreenState extends State<ActiveOrdersScreen> {



  final OrdersController ordersController = Get.find<OrdersController>();

  @override
  void initState() {
    ordersController.confirmedOrders.clear();
    ordersController.getConfirmedOrders();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: ColorsManager.customTeal,size: 27,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('الطلبات المنتهية : ',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      color: ColorsManager.customTeal,
                    ),)
                  ],
                ),
                SizedBox(height: 15.h,),
                Obx((){

                  if(ordersController.confirmedErrorMessage.isEmpty){

                    if(ordersController.confirmedOrders.isNotEmpty){
                      return AlignedGridView.count(
                          crossAxisCount: 1,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          itemCount: ordersController.confirmedOrders.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder:(context,index){
                            return OrderCard(paymentType: ordersController.confirmedOrders[index].paymentType.toString(),
                                status: ordersController.confirmedOrders[index].status.toString(),
                                totalPrice: ordersController.confirmedOrders[index].totalPrice.toString(),
                                points: ordersController.confirmedOrders[index].usedPoint,
                                finalPrice: ordersController.confirmedOrders[index].finalPrice.toString(),
                                imagePath: ordersController.confirmedOrders[index].qrImagePath);
                          });
                    }else{
                      return Center(
                        child: Text('لا يوجد طلبات ',style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),),
                      );
                    }


                  }else{
                    return Center(
                      child: Text('لا يوجد طلبات !! ',style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),),
                    );
                  }

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('الطلبات المنتهية : ',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                          color: ColorsManager.customTeal,
                        ),)
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Obx((){

                      if(ordersController.confirmedErrorMessage.isEmpty){

                        if(ordersController.confirmedOrders.isNotEmpty){
                          return AlignedGridView.count(
                                crossAxisCount: 1,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 16,
                                itemCount: ordersController.confirmedOrders.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder:(context,index){
                                  return OrderCard(paymentType: ordersController.confirmedOrders[index].paymentType.toString(),
                                      status: ordersController.confirmedOrders[index].status.toString(),
                                      totalPrice: ordersController.confirmedOrders[index].totalPrice.toString(),
                                      points: ordersController.confirmedOrders[index].usedPoint,
                                      finalPrice: ordersController.confirmedOrders[index].finalPrice.toString(),
                                      imagePath: ordersController.confirmedOrders[index].qrImagePath);
                                });
                        }else{
                          return Center(
                            child: Text('لا يوجد طلبات ',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                            ),),
                          );
                        }


                      }else{
                        return Center(
                          child: Text('لا يوجد طلبات !! ',style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),),
                        );
                      }

                    })
 */
