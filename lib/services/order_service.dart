
import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/upcoming_payments_models/upcoming_payment_model.dart';

import '../models/order_models/order_model.dart';


class OrderService {

  Dio dio;

  OrderService(this.dio);


  Future<List<OrderModel>> getPendingOrders()async{
   String url = ApiConstants.baseUrl + ApiConstants.getPendingOrders;
    try{
     Response response = await dio.get(url);

     if(response.statusCode == 200){
       List<dynamic> temp =  response.data['pend_orders '];
       return temp.map((obj)=> OrderModel.fromJson(obj)).toList();
     }
     return [];
    }catch(error){
      print('RRR ${error}');
      rethrow;
    }
  }


  Future<List<OrderModel>> getConfirmedOrders()async{
    String url = ApiConstants.baseUrl + ApiConstants.getConfirmedOrders;
    try{
      Response response = await dio.get(url);

      if(response.statusCode == 200){
        List<dynamic> temp =  response.data['orders'];
        return temp.map((obj)=> OrderModel.fromJson(obj)).toList();
      }
      return [];
    }catch(error){
      print('RRR ${error}');
      rethrow;
    }
  }


  Future<List<UpcomingPaymentModel>> getUnpaidPayments()async{
     String url = ApiConstants.baseUrl + ApiConstants.getUnpaid;
    try{

      Response response = await dio.get(url);


      if(response.statusCode == 200){
        List<dynamic> temp = response.data['installments'];
        return temp.map((obj)=>UpcomingPaymentModel.fromJson(obj)).toList();
      }
    return [];
    }catch(error){
      rethrow;
    }


  }


// Future<void> getQrCode()async{
  //
  //  String url = ApiConstants.baseUrl + ApiConstants.qrCode;
  //
  //   try{
  //
  //   Response response = await dio.get(url);
  //
  //   print('Res QR ${response} +    ${response.data}');
  //
  //   return;
  //   }catch(error){
  //   rethrow;
  //   }
  //
  // }

}