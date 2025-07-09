import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:get/get.dart';

class HomeMainScreenController extends GetxController{

  late HomeService service;
  List<GroceryGroupModel> categories = <GroceryGroupModel>[].obs;
  RxBool errorInCategories = false.obs;

  @override
  void onInit() {
    service = HomeService(Get.find());
    getGroceryGroupsCategories();
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



}