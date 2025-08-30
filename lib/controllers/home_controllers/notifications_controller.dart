import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/home_models/notification_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController{

  late RxList<NotificationModel> notifications;
  late HomeService homeService;

  RxString errorInNotifications = ''.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    notifications = <NotificationModel>[].obs;
    homeService = HomeService(Get.find<Dio>());
    super.onInit();
  }


  void getData(){

  }

  Future<Either<ErrorHandler,List<NotificationModel>>> getUserNotifications()async{

    try{

      final response = await homeService.getUserNotifications();

      notifications.addAll(response);
      isLoading.value = false;
      return Right(response);
    }catch(error){
      errorInNotifications.value = 'No Data ';
     return Left(ErrorHandler.handle(error));
    }


  }



}