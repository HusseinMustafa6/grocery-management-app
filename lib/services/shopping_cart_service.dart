import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/item_models/cart_item_model.dart';


class ShoppingCartService {

  Dio dio;

  ShoppingCartService(this.dio);



  Future<List<CartItemModel>> getUserCartItems()async{

   String url = ApiConstants.baseUrl + ApiConstants.getCartItems;

   try{
   Response response = await dio.get(url);

   List<dynamic> items = response.data;

   return items.map((item)=> CartItemModel.fromJson(item)).toList();
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




}