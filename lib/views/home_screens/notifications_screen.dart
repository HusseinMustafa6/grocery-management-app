import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/home_controllers/notifications_controller.dart';
import 'package:food_managemnet/core/widgets/home_widgets/notification_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {


  NotificationsController controller = Get.find<NotificationsController>();


  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      controller.getData();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
            child: Column(
              children: [
                Obx((){
                  if(controller.notifications.isNotEmpty){

                    return   AlignedGridView.count(
                      crossAxisCount: 1,
                      itemCount: controller.notifications.length,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NotificationCard(controller.notifications[index]);
                      },
                    );


                  }else{
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 100.h,horizontal: 30.w),
                      child: Text('لا يوجد إشعارات لعرضها',style: TextStyle(fontSize: 15,color: Colors.black54),),
                    );
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
