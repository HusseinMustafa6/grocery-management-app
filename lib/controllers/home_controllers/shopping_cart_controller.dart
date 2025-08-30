
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:food_managemnet/models/item_models/cart_item_model.dart';
import 'package:food_managemnet/models/item_models/cart_offer_model.dart';
import 'package:food_managemnet/models/item_models/check_out_order_response.dart';
import 'package:food_managemnet/models/item_models/order_model.dart';
import 'package:food_managemnet/services/shopping_cart_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




class ShoppingCartController extends GetxController{

  late RxList<CartItemModel> cartItems;
  late RxList<CartOfferModel> cartOffers;
  late ShoppingCartService service;
  RxDouble totalPrice = 0.0.obs;
  RxString selectedPaymentType = 'cash'.obs;

  Timer? _timer;

  @override
  void onInit() {
    cartItems = <CartItemModel>[].obs;
    cartOffers = <CartOfferModel>[].obs;
    service = ShoppingCartService(Get.find());
    //getUserCartItems();
    //calculateTotalPrice();
    //
    // _timer = Timer.periodic(Duration(seconds: 15), (timer){
    //     checkItemsQuantity();
    // });
   super.onInit();
  }

  @override
  void dispose() {
    //_timer!.cancel();
    super.dispose();
  }

  void calculateTotalPrice(){
    double sum = 0.0;
    int currentItemQuantity = 0;
    double currentItemPrice = 0.0;

    if(cartItems.isNotEmpty){
      for(CartItemModel item in cartItems){
        currentItemQuantity = num.parse(item.quantity.toString()).toInt();
        currentItemPrice = num.parse(item.priceForOne.toString()).toDouble();
        sum += currentItemPrice * currentItemQuantity;
      }
    }

    if(cartOffers.isNotEmpty){
      for(CartOfferModel offer in cartOffers){
       sum += num.parse(offer.data.discountValue.toString()).toDouble();
      }


    }


    // for(GroceryItem item in cartItems){
    //   sum += item.itemPrice! * item.quantity.value;
    // }
    totalPrice.value = sum;
  }



  Future<Either<ErrorHandler,String>> getUserCartItems()async{

    try{

      final response = await service.getUserCartItems();

      List<dynamic> items = response['items'];

      List<dynamic> offers = response['offers'];

      cartItems.value = items.map((obj)=> CartItemModel.fromJson(obj)).toList();
      cartOffers.value = offers.map((obj)=> CartOfferModel.fromJson(obj)).toList();

      return  Right('');
    }catch(error){

    return Left(ErrorHandler.handle(error));
    }



  }


  Future<Either<ErrorHandler,String>> deleteItemFromCart(int? cartItemId)async{

    try{

      final response = await  service.deleteItemFromCart(cartItemId);
      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }


  }

  Future<Either<ErrorHandler,String>> deleteOfferFromCart(int? offerId)async{

    try{

      final response = await  service.deleteOfferFromCart(offerId);
      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }


  }


  Future<Either<ErrorHandler,bool>> updateItemQuantity(CartItemModel item)async{


    try{
      final response = await service.updateItemQuantity(item);

      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }


  }
  Future<Either<ErrorHandler,bool>> updateOfferQuantity(CartOfferModel offer)async{


    try{
      final response = await service.updateOfferQuantity(offer);

      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }


  }



  void checkItemsQuantity(){
    // TODO : this function will check that every quantity is in the right number
    print('in timer function');
    if(cartItems.isEmpty || cartOffers.isEmpty){
      return;
    }
    for(CartItemModel currentItem in cartItems){
      updateItemQuantity(currentItem);
    }

    for(CartOfferModel offer in cartOffers){
      updateOfferQuantity(offer);
    }

    cartOffers.clear();
    cartItems.clear();
    getUserCartItems();
  }

  Future<Either<ErrorHandler,CheckOutOrderResponse>> checkOutOrder()async{

   List<OrderItemModel> currentItems = cartItems.map((obj)=>OrderItemModel(cartItemId: obj.id,
       quantity:num.parse(obj.quantity.toString()).toInt())).toList();


   List<OrderOfferModel> currentOffers = cartOffers.map((obj)=>OrderOfferModel(cartOfferId: obj.cartOfferId,
       quantity: num.parse(obj.quantity.toString()).toInt())).toList();


    try{
    OrderModel order = OrderModel(
        paymentType: selectedPaymentType.value,
        points: 0,
        items: currentItems,
        offers: currentOffers
    );

    final response = await service.checkOutOrder(order);

    return Right(response);
  }catch(error){
      return Left(ErrorHandler.handle(error));
  }

  }



  // void getData(){
  //   Future.delayed(Duration(seconds: 5),(){
  //     cartItems.add(GroceryItem(itemName: 'Product 1',itemDescription: 'This is a  description about this product' , imagePath: 'assets/images/cart_item_pic.png', itemPrice: 400));
  //     cartItems.add(GroceryItem(itemName: 'Product 2',itemDescription: 'This is a  description about this product', imagePath: 'assets/images/cart_item_pic.png', itemPrice: 100));
  //     cartItems.add(GroceryItem(itemName: 'Product 3',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 240));
  //     cartItems.add(GroceryItem(itemName: 'Product 4',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 310));
  //     cartItems.add(GroceryItem(itemName: 'Product 5',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 23));
  //     cartItems.add(GroceryItem(itemName: 'Product 6',itemDescription:  'This is a  description about this product',imagePath: 'assets/images/cart_item_pic.png', itemPrice: 44));
  //
  //
  //   });
  //
  // }


}