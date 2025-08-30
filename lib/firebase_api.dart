import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';





Future<void> handleBackgroundMessage(RemoteMessage message)async{
  print('Title ${message.notification?.title}');
  print('Body ${message.notification?.body}');
  print('Data ${message.data}');


}



class FirebaseApi{

  final _firebaseMessaging = FirebaseMessaging.instance;


  static var fcmTokenToStore = '';

  Future<void> initNotifications()async{
    await _firebaseMessaging.requestPermission();
    final fcmToken  =  await _firebaseMessaging.getToken();
    FirebaseApi.fcmTokenToStore = fcmToken.toString();
    print(' FCM Token : ${fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Notification Title: ${message.notification?.title}');
        print('Notification Body: ${message.notification?.body}');
      }
    });



  }

   Future<void> storeFCMTokenToDB()async{

    Dio dio = Get.find<Dio>();


    String url = ApiConstants.baseUrl + ApiConstants.saveFcmToken;

    try{

    final response = await dio.post(url,data: {
      'device_token':fcmTokenToStore
    });

    if(response.statusCode == 200){
      print(response.data['message']);
    }


    }catch(error){
     print('ERORROROR ${error}');

    }

    // var url = Uri.parse(ServerConfiguration.domainName+ServerConfiguration.storeFCMToken);
    //
    // var response = await http.post(url,
    //     headers: {
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer ${User.userToken}'
    //     },
    //     body: {
    //       'user_id': User.userID.toString(),
    //       'fcm_token': fcmTokenToStore
    //     }
    // );
    //
    // if(response.statusCode == 200){
    //   print('Done FCM TOKEN IS STORED');
    //
    // }




  }



}