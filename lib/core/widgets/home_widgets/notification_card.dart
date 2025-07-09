import 'package:flutter/material.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';

import '../../../models/home_models/notification_model.dart';

class NotificationCard extends StatelessWidget {


  NotificationModel notificationModel;

  NotificationCard(this.notificationModel);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT: Icon + Text
                Expanded( // 👈 This makes the entire left side use available space
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.notifications,
                          color: ColorsManager.customTeal,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 5),

                      // Text Column wrapped in Expanded
                      Expanded( // 👈 This makes the text use remaining space in the row
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notificationModel.title.toString(),
                              style: TextStyle(
                                fontSize: 14, // Or 14.sp if using screenutil
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              notificationModel.content.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // RIGHT: Date

                Text(
                    DateTime.now().toString().substring(0, 10),
                    style: TextStyle(fontSize: 10),
                  ),

                // Column(
                //   children: [
                //
                //   ],
                // ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Divider(
            thickness: 1,
            color: ColorsManager.customGrey,
          ),
        ),
      ],
    )
    ;
  }

}

/*
@override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10.0 , vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications_on, size: 15, color: MyColors.darkGreen,),
                ),
              ),
              SizedBox(width: 8,),
              Text('لقد وصلك اشعار ',
                style: TextStyle(fontSize: 14),maxLines: 2,overflow: TextOverflow.ellipsis,),
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('12:00PM',
                      style: TextStyle(color: MyColors.customGrey, fontSize: 10),),
                    Text('28/4/2024',
                      style: TextStyle(color: Colors.black, fontSize: 12),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 */