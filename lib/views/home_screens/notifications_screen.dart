import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_managemnet/controllers/home_controllers/notifications_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/home_widgets/notification_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  /*
  php artisan config:clear
php artisan config:cache
   */

  NotificationsController controller = Get.find<NotificationsController>();


  @override
  void initState() {
    controller.notifications.clear();
    controller.getUserNotifications();
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

                  if(controller.isLoading.isTrue){
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.customTeal,
                      ),
                    );
                  }else{

                    if(controller.errorInNotifications.isEmpty){
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
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('لا يوجد إشعارات لعرضها',style: TextStyle(fontSize: 15,color: Colors.black54),),
                          ],
                        );
                      }
                    }else{

                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.errorInNotifications.value,style: TextStyle(fontSize: 15,color: Colors.black54),),
                        ],
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
