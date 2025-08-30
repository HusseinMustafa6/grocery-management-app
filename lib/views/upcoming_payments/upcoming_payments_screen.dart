import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/upcoming_payments_controller.dart';
import 'package:food_managemnet/core/widgets/upcoming_payments_widgets/upcoming_payment_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/theming/colors_manager.dart';


class UpcomingPaymentsScreen extends StatefulWidget {

  @override
  State<UpcomingPaymentsScreen> createState() => _UpcomingPaymentsScreenState();
}

class _UpcomingPaymentsScreenState extends State<UpcomingPaymentsScreen> {

  UpcomingPaymentsController controller = Get.find<UpcomingPaymentsController>();


  @override
  void initState() {
    controller.payments.clear();
    controller.getUnpaidPayments();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: ColorsManager.customTeal,size: 27,)),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('الدفعات المتبقية',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                          color: ColorsManager.customTeal,
                        ),)
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Obx((){

                      if(controller.isLoading.isTrue){
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.customTeal,
                          ),
                        );
                      }else{
                        if(controller.errorInPayments.isEmpty){

                          if(controller.payments.isNotEmpty){
                            return AlignedGridView.count(
                                crossAxisCount: 1,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 16,
                                itemCount: controller.payments.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder:(context,index){
                                  return UpcomingPaymentCard(
                                      controller.payments[index]
                                  );
                                });} else{
                            return Center(
                              child: Text('لا يوجد دفعات ',style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                              ),),
                            );
                          }


                        }else{
                          return Center(
                            child: Text('لا يوجد دفعات !! ',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                            ),),
                          );
                        }
                      }



                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
