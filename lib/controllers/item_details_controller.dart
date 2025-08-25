
import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/item_models/item_details_model.dart';
import 'package:food_managemnet/models/item_models/item_unit_model.dart';
import 'package:food_managemnet/models/units_models/unit_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:food_managemnet/services/shopping_cart_service.dart';
import 'package:get/get.dart';

class  ItemDetailsController extends GetxController {

  ItemDetailsModel? itemDetailsModel;
  ItemUnitsModel? itemUnitsModel;
  List<UnitModel>? allUnits;
  List<UnitModel>? currentUnits;
  late HomeService service;
  late ShoppingCartService cartService;
  RxString errorMessage = ''.obs;
  RxBool isExists = false.obs;

  @override
  void onInit() async {
    service = HomeService(Get.find());
    cartService = ShoppingCartService(Get.find());
    currentUnits = [];
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

  Future<Either<ErrorHandler, ItemUnitsModel>> getItemUnitDetails(
      int? id) async {
    final response = await service.getItemUnitDetails(id);

    try {
      itemUnitsModel = response;
      print('item unit id : ${itemUnitsModel!.units.first.id}');
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

  Future<Either<ErrorHandler,List<UnitModel>>> getAllUnits()async{


    final response = await service.getAllUnits();

    try{
      allUnits = response;
      currentUnits?.clear();
      mapUnitsToCurrentItem();
      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));

    }

  }

    void mapUnitsToCurrentItem(){


    for(UnitModel unit in allUnits!) {
      for (ItemUnitModel model in itemUnitsModel!.units) {
        if (model.unitId == unit.id){
          currentUnits!.add(unit);
        }
      }
    }

  }



  List<int> buildAvilableQunatityOptions(){

    List<int> quantities = [];
    int length = num.parse(itemDetailsModel!.availableQuantity.toString()).toInt();

    for(int i = 1 ; i <= length ; i++){

     quantities.add(i);

    }

    return quantities;
  }




}