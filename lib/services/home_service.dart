import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:food_managemnet/models/item_models/check_out_order_response.dart';
import 'package:food_managemnet/models/item_models/item_details_model.dart';
import 'package:food_managemnet/models/item_models/item_unit_model.dart';
import 'package:food_managemnet/models/item_models/order_model.dart';
import 'package:food_managemnet/models/units_models/unit_model.dart';

import '../models/offer_models/offer_model.dart';

class HomeService{

  Dio dio;

  HomeService(this.dio);



  Future<List<GroceryGroupModel>> getGroceryCategories()async{

    String url = ApiConstants.baseUrl + ApiConstants.groceryCategories;

    try{
    Response response = await dio.get(url);

    List<dynamic> categories = response.data;
    return categories.map((obj)=> GroceryGroupModel.fromJson(obj)).toList();
    }catch(error){
      rethrow;
    }

  }


  Future<List<ProductModel>> getAllItems()async{

    String url = ApiConstants.baseUrl + ApiConstants.getAllItems;

    try{

    Response response = await dio.get(url);

    List<dynamic> products = response.data;

     return products.map((item)=>ProductModel.fromJson(item)).toList();
    }catch(error){
      rethrow;
    }


  }


  Future<ItemDetailsModel> getItemDetails(int? id)async{

    String url = ApiConstants.baseUrl + ApiConstants.getItemDetails + id.toString();

    try{
      Response response = await dio.get(url);

      return ItemDetailsModel.fromJson(response.data);
    }catch(error){
      rethrow;
    }


  }


  Future<ItemUnitsModel> getItemUnitDetails(int? id)async{

    String url = ApiConstants.baseUrl + ApiConstants.getItemUnitDetails + id.toString();

    try{
      Response response = await dio.get(url);

      return ItemUnitsModel.fromJson(response.data);
    }catch(error){
      rethrow;
    }


  }



  Future<int> getUserPoints()async{

    String url = ApiConstants.baseUrl + ApiConstants.getUserPoints;
    try{

     Response response = await dio.get(url);

     if(response.statusCode == 200){
       return response.data['points'];
     }
     return 0;
    }catch(error){
      rethrow;
    }

  }

  Future<List<OfferModel>> getAllOffers()async{

  String url = ApiConstants.baseUrl + ApiConstants.getAllOffers;

  try{

  Response response = await dio.get(url);

  if(response.statusCode == 200){
    List<dynamic> temp = response.data['data'];
    print( response.data['data']);
    return temp.map((obj)=> OfferModel.fromJson(obj)).toList();
  }
  return [];
  }catch(error){
    print('ee $error');
    rethrow;
  }



  }

  Future<List<UnitModel>> getAllUnits()async{

    String url = ApiConstants.baseUrl + ApiConstants.getAllUnits;
    try{
    Response response = await dio.get(url);

    List<dynamic> temp = response.data;

    return temp.map((obj)=>UnitModel.fromJson(obj)).toList();
    }catch(error){
      rethrow;
    }

  }

  Future<bool> addOfferToCart({required int? offerId,required int? quantity})async{

    String url = ApiConstants.baseUrl + ApiConstants.addItemToCart;
    try{
      Response response = await dio.post(url,data:{
        'offer_id':offerId,
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





}