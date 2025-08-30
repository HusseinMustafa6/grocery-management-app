import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/upcoming_payments_models/upcoming_payment_model.dart';
import 'package:food_managemnet/services/order_service.dart';
import 'package:get/get.dart';

class UpcomingPaymentsController extends GetxController{


  late RxList<UpcomingPaymentModel> payments;
  late OrderService service;

  RxBool isLoading = true.obs;
  RxString errorInPayments = ''.obs;

  @override
  void onInit() {
    payments = <UpcomingPaymentModel>[].obs;
    service = OrderService(Get.find<Dio>());
  }

  Future<Either<ErrorHandler,List<UpcomingPaymentModel>>> getUnpaidPayments()async{

    try{
      final response = await service.getUnpaidPayments();

      payments.addAll(response);
      isLoading.value = false;

      return Right(response);
    }catch(error) {
      errorInPayments.value = 'No Data';
    return Left(ErrorHandler.handle(error));
    }

  }



}