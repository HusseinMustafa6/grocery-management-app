import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/item_models/cart_item_model.dart';
import 'package:food_managemnet/models/offer_models/offer_model.dart';

import '../models/item_models/cart_offer_model.dart';
import '../models/item_models/check_out_order_response.dart';
import '../models/item_models/order_model.dart';


class ShoppingCartService {

  Dio dio;

  ShoppingCartService(this.dio);



  Future<dynamic> getUserCartItems()async{

   String url = ApiConstants.baseUrl + ApiConstants.getCartItems;

   try{
   Response response = await dio.get(url);

   //List<dynamic> items = response.data;
   //return items.map((item)=> CartItemModel.fromJson(item)).toList();

   return response.data;
   }catch(error){
     print('Cart Error ${error}');
     rethrow;
   }

  }


  Future<bool> addItemToCart({int? itemUnitId , int? quantity})async{

    String url = ApiConstants.baseUrl + ApiConstants.addItemToCart;

    try{
     Response response = await dio.post(url,data: {
       'item_unit_id':itemUnitId,
       'quantity':quantity
     });


     if(response.statusCode == 201){
       return true;
     }

    return false;
    }catch(error){
      rethrow;
    }



  }


  Future<String> deleteItemFromCart(int? cartItemId)async{

   String url = ApiConstants.baseUrl + ApiConstants.deleteItemFromCart + cartItemId.toString();

   try{

    Response response = await dio.delete(url);

    return response.data['message'];
   }catch(error){
     rethrow;
   }
  }


  Future<bool> updateItemQuantity(CartItemModel item)async{

    String url = ApiConstants.baseUrl + ApiConstants.updateItemFromCartQuantity + item.id.toString();

    try{

     Response response = await dio.put(url,data: {
       'item_unit_id':item.itemUnitId,
       'quantity': num.parse(item.quantity.toString()).toInt()
     });

     if(response.statusCode == 200){
       return true;
     }
     return false;
    }catch(error){
      rethrow;
    }





  }



  Future<String> deleteOfferFromCart(int? cartOfferId)async{

    String url = ApiConstants.baseUrl + ApiConstants.deleteOfferFromCart + cartOfferId.toString();

    try{

      Response response = await dio.delete(url);

      return response.data['message'];
    }catch(error){
      rethrow;
    }
  }

  Future<bool> updateOfferQuantity(CartOfferModel offerModel)async{

    String url = ApiConstants.baseUrl + ApiConstants.updateOfferFromCartQuantity + offerModel.toString();

    try{

      Response response = await dio.put(url,data: {
        'quantity': num.parse(offerModel.quantity.toString()).toInt()
      });

      if(response.statusCode == 200){
        return true;
      }
      return false;
    }catch(error){
      rethrow;
    }





  }


  Future<CheckOutOrderResponse> checkOutOrder(OrderModel order)async{

    String url = ApiConstants.baseUrl + ApiConstants.checkOutOrder;

    Map<String,dynamic> data = {
      'payment_type': order.paymentType,
      'points_used':order.points,
      'items':order.items.map((obj)=> obj.toJson()).toList(),
      'offers':order.offers.map((obj)=>obj.toJson()).toList()
    };

    if(order.items.isEmpty){
      data =  {
        'payment_type': order.paymentType,
        'points_used':order.points,
        'offers':order.offers.map((obj)=>obj.toJson()).toList()
      };
    }

    if(order.offers.isEmpty){
      data = {
        'payment_type': order.paymentType,
        'points_used':order.points,
        'items':order.items.map((obj)=> obj.toJson()).toList(),
      };
    }


    print('FDAD $data');

    try{
     // FormData data = FormData.fromMap({
     //   'payment_type': order.paymentType,
     //   'points_used':order.points,
     //   'items':order.items.map((obj)=> obj.toJson()).toList()
     // });
    // Map<String,dynamic> data = {
    //   'payment_type': order.paymentType,
    //   'points_used':order.points,
    //   'items':order.items.map((obj)=> obj.toJson()).toList()
    // };
    //  print('DATA ${order.items.map((obj)=> obj.toJson()).toList()}');

      Response response = await dio.post(url,
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': dio.options.headers['Authorization'],
            'Content-Type': 'application/json',
          }
        )
      );

      return CheckOutOrderResponse.fromJson(response.data);
    }catch(error){
      rethrow;
    }
  }





}