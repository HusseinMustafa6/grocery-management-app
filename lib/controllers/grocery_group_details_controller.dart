import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/models/home_models/subcategory_model.dart';
import 'package:food_managemnet/services/groceries_service.dart';
import 'package:get/get.dart';


class GroceryGroupDetailsController extends GetxController{

  late GroceriesService service;
  late RxList<SubcategoryModel> subcategories;
  RxBool errorInSubcategories = false.obs;



  @override
  void onInit() {
    service = GroceriesService(Get.find());
    subcategories = <SubcategoryModel>[].obs;
    super.onInit();
  }

  Future<Either<ErrorHandler,List<SubcategoryModel>>> getSubcategories(int? categoryId)async{

    try{
     final response = await service.getSubcategoriesById(categoryId);

     errorInSubcategories.value = false;
     subcategories.value = response;
     return Right(response);
    }catch(error){

      errorInSubcategories.value = true;
      return Left(ErrorHandler.handle(error));
    }

  }




}