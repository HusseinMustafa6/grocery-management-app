import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GroceryItem{

   String? itemName;
   String? itemDescription;
   String? imagePath;
   double? itemPrice;
   RxInt quantity = 0.obs;
   RxBool isFavorite = false.obs;

  GroceryItem({
    required this.itemName,
    required this.itemDescription,
    required this.imagePath,
    required this.itemPrice
});



  GroceryItem.fromJson(Map<String,dynamic> jsonObject){


  }





}