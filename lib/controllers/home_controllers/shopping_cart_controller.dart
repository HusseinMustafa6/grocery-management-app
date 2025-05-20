import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:get/get.dart';




class ShoppingCartController extends GetxController{

  late RxList<GroceryItem> cartItems;


  @override
  void onInit() {
    cartItems = <GroceryItem>[].obs;
  }

  void getData(){
    Future.delayed(Duration(seconds: 5),(){
      cartItems.add(GroceryItem(itemName: 'Product 1', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '400'));
      cartItems.add(GroceryItem(itemName: 'Product 2', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '100'));
      cartItems.add(GroceryItem(itemName: 'Product 3', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '240'));
      cartItems.add(GroceryItem(itemName: 'Product 4', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '310'));
      cartItems.add(GroceryItem(itemName: 'Product 5', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '23'));
      cartItems.add(GroceryItem(itemName: 'Product 6', imagePath: 'assets/images/cart_item_pic.png', itemPrice: '44'));


    });

  }


}