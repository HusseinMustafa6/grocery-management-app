
import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/item_models/item_details_model.dart';
import 'package:food_managemnet/models/item_models/item_unit_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:food_managemnet/services/shopping_cart_service.dart';
import 'package:get/get.dart';

class  ItemDetailsController extends GetxController {

  ItemDetailsModel? itemDetailsModel;
  ItemUnitModel? itemUnitModel;
  late HomeService service;
  late ShoppingCartService cartService;
  RxString errorMessage = ''.obs;
  RxBool isExists = false.obs;

  @override
  void onInit() async {
    service = HomeService(Get.find());
    cartService = ShoppingCartService(Get.find());
  }

  dispose() {
    isExists.value = false;
  }

  Future<Either<ErrorHandler, ItemDetailsModel>> getItemDetails(int? id) async {
    final response = await service.getItemDetails(id);

    try {
      itemDetailsModel = response;

      isExists.value = true;
      return Right(response);
    } catch (error) {
      isExists.value = false;
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<ErrorHandler, ItemUnitModel>> getItemUnitDetails(
      int? id) async {
    final response = await service.getItemUnitDetails(id);

    try {
      itemUnitModel = response;
      print('item unit id : ${itemUnitModel!.id}');
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }


  Future<Either<ErrorHandler,bool>> addItemToCart({int? itemUnitId , int? quantity})async{


    final response = await cartService.addItemToCart(itemUnitId: itemUnitId,quantity: quantity);

    try{

      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));

    }

  }


}