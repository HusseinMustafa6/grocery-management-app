

class ApiConstants {

  static const String baseUrl = "http://192.168.1.102:8000/api/";

  static const String imageBaseUrl = "http://192.168.1.102:8000/";


  static const String loginUrl = "login";

  static const String registerUrl = "registerRequests";

  static const String groceryCategories = "showCategories";

  static const String getSubcategories = "showSubCategories/";


  static const String getItemsInCategory = "ItemsInCategory/";


  // to show all avilable products in HOME Screen
  static const String getAllItems = "showAllItems";

  static const String getItemDetails = "itemDetails/";

  static const String getItemUnitDetails = "showAllItemUnit/";


  static const String getAllUnits = "showUnits";

  // SHOPPING CART APIs

  static const String getCartItems = "cart-items";

  static const String addItemToCart = "cart-items";

  static const String deleteItemFromCart = "cart-items/item/";

  static const String updateItemFromCartQuantity = "cart-items/item/";


  static const String deleteOfferFromCart = "cart-items/offer/";

  static const String updateOfferFromCartQuantity = "cart-items/offer/";



  // ORDER APIs

  static const String checkOutOrder = "orders/confirm";

  static const String getUserPoints = "showPoints";

  static const String getPendingOrders = "getPendedOrders";

  static const String getConfirmedOrders = "getUserActiveOrders";






  // OFFERs APIs
  static const String getAllOffers = "showAllOffers";




  // PRofile APIs
 static const String changePassword = "updateProfile";

 static const String updateProfile = "updateProfile";


 static const String getUserProfile = "profile";



 static const String saveFcmToken = "notifications/store-device-token";


 static const String getUserNotifications = "notifications";

 static const String getUnpaid = "getAllUserUnpaidInstallments";

}