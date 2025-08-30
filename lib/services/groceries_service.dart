import 'package:dio/dio.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:food_managemnet/models/home_models/subcategory_model.dart';



class GroceriesService{

  Dio dio;


  GroceriesService(this.dio);


  Future<List<SubcategoryModel>> getSubcategoriesById(int? categoryId)async{
    String url = ApiConstants.baseUrl + ApiConstants.getSubcategories + categoryId.toString();
    try{

    Response response = await dio.get(url);

    List<dynamic> subCategories = response.data;

    return subCategories.map((obj)=> SubcategoryModel.fromJson(obj)).toList();
    }catch(error){
      rethrow;
    }
  }


  Future<List<ProductModel>> getItemsInCategory(int? categoryId)async{

   String url = ApiConstants.baseUrl + ApiConstants.getItemsInCategory + categoryId.toString();

   try{

    Response response = await dio.get(url);

    List<dynamic> items = response.data;

    return items.map((obj)=>ProductModel.fromJson(obj)).toList();
   }catch(error){
     rethrow;
   }

  }






}