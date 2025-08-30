import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/orders_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/orders_widgets/order_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({super.key});

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {

  final OrdersController pendingOrdersController = Get.find<OrdersController>();


  @override
  void initState() {
    pendingOrdersController.pendingOrders.clear();
    pendingOrdersController.getPendingOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: ColorsManager.customTeal,size: 27,)),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers:[
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('الطلبات المعلقة : ',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                          color: ColorsManager.customTeal,
                        ),)
                      ],
                    ),
                    SizedBox(height: 15.h,),

                    Obx((){

                      if(pendingOrdersController.pendingLoading.isTrue){
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.customTeal,
                          ),
                        );
                      }else{

                        if(pendingOrdersController.pendingStatus.isTrue){
                          // Get The Data
                         if(pendingOrdersController.pendingOrders.isNotEmpty){
                           return
                             AlignedGridView.count(
                                 crossAxisCount: 1,
                                 mainAxisSpacing: 8,
                                 crossAxisSpacing: 16,
                                 itemCount: pendingOrdersController.pendingOrders.length,
                                 shrinkWrap: true,
                                 physics: BouncingScrollPhysics(),
                                 itemBuilder:(context,index){
                                   return OrderCard(paymentType: pendingOrdersController.pendingOrders[index].paymentType.toString(),
                                       status: pendingOrdersController.pendingOrders[index].status.toString(),
                                       totalPrice: pendingOrdersController.pendingOrders[index].totalPrice.toString(),
                                       points: pendingOrdersController.pendingOrders[index].usedPoint,
                                       finalPrice: pendingOrdersController.pendingOrders[index].finalPrice.toString(),
                                       imagePath: pendingOrdersController.pendingOrders[index].qrImagePath);
                                 });
                         }else{
                           return Center(
                             child: Text('لا يوجد طلبات معلقة',style: TextStyle(
                               fontSize: 16,
                               color: Colors.black54,
                               fontWeight: FontWeight.w700,
                             ),),
                           );
                         }

                        }else{
                          // API ERROR
                          return Center(
                            child: Text('SERVER ERROR',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                            ),),
                          );
                        }


                      }

                    }),

                  ],
                ),
              ) ,
            )

          ]
        ),
      ),
    );
  }
}
