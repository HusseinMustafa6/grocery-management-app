import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:food_managemnet/models/item_models/item_details_model.dart';
import 'package:food_managemnet/models/item_models/item_unit_model.dart';

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


  Future<ItemUnitModel> getItemUnitDetails(int? id)async{

    String url = ApiConstants.baseUrl + ApiConstants.getItemUnitDetails + id.toString();

    try{
      Response response = await dio.get(url);

      return ItemUnitModel.fromJson(response.data['data'][0]);
    }catch(error){
      rethrow;
    }


  }




}