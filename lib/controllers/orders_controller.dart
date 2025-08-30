import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/services/order_service.dart';
import 'package:get/get.dart';

import '../models/order_models/order_model.dart';


class OrdersController extends GetxController{

  late OrderService orderService;
  // = pending orders variables ==
  RxList<OrderModel> pendingOrders = <OrderModel>[].obs;
  RxList<OrderModel> confirmedOrders = <OrderModel>[].obs;
  RxString confirmedErrorMessage = ''.obs;


  RxBool pendingStatus = false.obs; // Api Response
  RxBool pendingLoading = true.obs;
  RxString pendingErrorMessage = ''.obs;
  // = pending orders variables ==


  @override
  void onInit() {
    orderService = OrderService(Get.find());
    super.onInit();
  }


  Future<Either<ErrorHandler,List<OrderModel>>> getPendingOrders()async{

   try{
     final response = await orderService.getPendingOrders();

     pendingOrders.addAll(response);
     pendingLoading.value = false;
     print('lll');
     pendingStatus.value = true;
     return Right(response);
   }catch(error){
     pendingLoading.value = false;
     pendingStatus.value = false;
     return Left(ErrorHandler.handle(error));
   }
  }

  Future<Either<ErrorHandler,List<OrderModel>>> getConfirmedOrders()async{

    try{
      final response = await orderService.getConfirmedOrders();

      confirmedOrders.addAll(response);
      return Right(response);
    }catch(error){
      confirmedErrorMessage.value = 'No Data !';
      return Left(ErrorHandler.handle(error));
    }
  }



}