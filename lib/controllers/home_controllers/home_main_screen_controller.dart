import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:get/get.dart';

class HomeMainScreenController extends GetxController{

  late HomeService service;
  List<GroceryGroupModel> categories = <GroceryGroupModel>[].obs;
  List<ProductModel> allItems = <ProductModel>[].obs;
  RxBool errorInCategories = false.obs;


  RxBool errorInAllItems = false.obs;
  String? errorMessageInAllItems;

  @override
  void onInit() {
    service = HomeService(Get.find());
    getGroceryGroupsCategories();
    getAllItems();
  }

  Future<Either<ErrorHandler,List<GroceryGroupModel>>> getGroceryGroupsCategories()async{

    try{
    final response = await service.getGroceryCategories();

    errorInCategories.value = false;
    categories.addAll(response);
    return Right(response);
    }catch(error){
    errorInCategories.value = true;
    return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<ErrorHandler,List<ProductModel>>> getAllItems()async{


    try{

      final response = await service.getAllItems();

      errorInAllItems.value = false;
      allItems.addAll(response);
      return Right(response);
    }catch(error){
      errorInAllItems.value = true;
      errorMessageInAllItems = ErrorHandler.handle(error).apiErrorModel.message;
      return Left(ErrorHandler.handle(error));
    }


  }



}