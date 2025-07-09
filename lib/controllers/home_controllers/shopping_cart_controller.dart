import 'package:food_managemnet/models/grocery_item_model.dart';
import 'package:get/get.dart';




class ShoppingCartController extends GetxController{

  late RxList<GroceryItem> cartItems;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    cartItems = <GroceryItem>[].obs;
  }


  void calculateTotalPrice(){
    double sum = 0.0;
    for(GroceryItem item in cartItems){
      sum += item.itemPrice! * item.quantity.value;
    }
    totalPrice.value = sum;
  }


  void getData(){
    Future.delayed(Duration(seconds: 5),(){
      cartItems.add(GroceryItem(itemName: 'Product 1',itemDescription: 'This is a  description about this product' , imagePath: 'assets/images/cart_item_pic.png', itemPrice: 400));
      cartItems.add(GroceryItem(itemName: 'Product 2',itemDescription: 'This is a  description about this product', imagePath: 'assets/images/cart_item_pic.png', itemPrice: 100));
      cartItems.add(GroceryItem(itemName: 'Product 3',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 240));
      cartItems.add(GroceryItem(itemName: 'Product 4',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 310));
      cartItems.add(GroceryItem(itemName: 'Product 5',itemDescription: 'This is a  description about this product' ,imagePath: 'assets/images/cart_item_pic.png', itemPrice: 23));
      cartItems.add(GroceryItem(itemName: 'Product 6',itemDescription:  'This is a  description about this product',imagePath: 'assets/images/cart_item_pic.png', itemPrice: 44));


    });

  }


}