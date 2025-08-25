import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/home_models/grocery_model.dart';
import 'package:food_managemnet/models/home_models/product_model.dart';
import 'package:food_managemnet/models/offer_models/offer_model.dart';
import 'package:food_managemnet/services/home_service.dart';
import 'package:get/get.dart';

class HomeMainScreenController extends GetxController{

  late HomeService service;
  List<GroceryGroupModel> categories = <GroceryGroupModel>[].obs;
  List<ProductModel> allItems = <ProductModel>[].obs;
  RxBool errorInCategories = false.obs;
  RxInt userPoints = 0.obs;

  RxBool errorInAllItems = false.obs;
  String? errorMessageInAllItems;


  List<OfferModel> allOffers = <OfferModel>[].obs;
  RxBool offersLoading = true.obs;
  RxBool offersStatus = false.obs;
  RxString offersError = ''.obs;



  RxBool addOfferToCartStatus = false.obs;

  @override
  void onInit() {
    service = HomeService(Get.find());
    getGroceryGroupsCategories();
    getAllItems();
    getUserPoints();
    getAllOffers();
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

  Future<Either<ErrorHandler,int>> getUserPoints()async{

    try {
      final response = await service.getUserPoints();

      userPoints.value = response;
      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<ErrorHandler,List<OfferModel>>> getAllOffers()async{

   try{

    final response = await service.getAllOffers();
    allOffers.addAll(response);
    offersLoading.value = false;
    offersStatus.value = true;
    return Right(response);
   }catch(error){
     offersStatus.value = false;
     return Left(ErrorHandler.handle(error));
   }

  }

  Future<Either<ErrorHandler,bool>> addOfferToCart({required int? offerId,required int? quantity})async {
    try{

    final response = await service.addOfferToCart(offerId: offerId, quantity: quantity);

    addOfferToCartStatus.value = response;
    return Right(response);
    }catch(error){
     return Left(ErrorHandler.handle(error));
    }
  }



  }