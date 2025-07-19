
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:food_managemnet/core/networking/api_error_handler.dart';
import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:food_managemnet/models/item_models/cart_item_model.dart';
import 'package:food_managemnet/services/shopping_cart_service.dart';
import 'package:get/get.dart';




class ShoppingCartController extends GetxController{

  late RxList<CartItemModel> cartItems;
  late ShoppingCartService service;
  RxDouble totalPrice = 0.0.obs;

  Timer? _timer;

  @override
  void onInit() {
    cartItems = <CartItemModel>[].obs;
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

    if(cartItems.isEmpty){
      return;
    }
    for(CartItemModel item in cartItems){
      currentItemQuantity = num.parse(item.quantity.toString()).toInt();
      currentItemPrice = num.parse(item.priceForOne.toString()).toDouble();
      sum += currentItemPrice * currentItemQuantity;
    }

    // for(GroceryItem item in cartItems){
    //   sum += item.itemPrice! * item.quantity.value;
    // }
    totalPrice.value = sum;
  }



  Future<Either<ErrorHandler,List<CartItemModel>>> getUserCartItems()async{

    try{

      final response = await service.getUserCartItems();

      cartItems.addAll(response);
      return  Right(response);
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


  Future<Either<ErrorHandler,bool>> updateItemQuantity(CartItemModel item)async{


    try{
      final response = await service.updateItemQuantity(item);

      return Right(response);
    }catch(error){
      return Left(ErrorHandler.handle(error));
    }


  }



  void checkItemsQuantity(){
    // TODO : this function will check that every quantity is in the right number
    print('in timer function');
    if(cartItems.isEmpty){
      return;
    }
    for(CartItemModel currentItem in cartItems){
      updateItemQuantity(currentItem);
    }
    cartItems.clear();
    getUserCartItems();
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