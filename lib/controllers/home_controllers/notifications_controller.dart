import 'package:food_managemnet/models/home_models/notification_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController{

  late RxList<NotificationModel> notifications;


  @override
  void onInit() {
    notifications = <NotificationModel>[].obs;
    super.onInit();
  }


  void getData(){
    notifications.add(NotificationModel(title: 'Notification 1', content: 'description about this notification , description about this notification description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 2', content: 'description about this notification , description about this notification description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 3', content: 'description about this notification , description about this notification description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 4', content: 'description about this notification , description about this notification description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 5', content: 'description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 6', content: 'description about this notification', date: '2020'));
    notifications.add(NotificationModel(title: 'Notification 7', content: 'description about this notification', date: '2020'));

  }



}