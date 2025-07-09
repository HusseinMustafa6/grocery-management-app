import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';

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



}