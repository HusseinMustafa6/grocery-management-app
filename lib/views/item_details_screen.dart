import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/item_details_controller.dart';
import 'package:food_managemnet/core/networking/api_constants.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/models/item_models/item_details_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


// This Screen show product full details

class ItemDetailsScreen extends StatefulWidget {
  
  final int? itemId;
  
  ItemDetailsScreen({required this.itemId});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  

  final ItemDetailsController controller =  Get.find<ItemDetailsController>();


  RxInt? selectedUnit;
  RxInt selectedQuantity = 1.obs;

  TextEditingController quantityController = TextEditingController();


  @override
  initState(){
    setState(() {
      controller.getItemDetails(widget.itemId);
      controller.getItemUnitDetails(widget.itemId);
      controller.getAllUnits();
    });
    super.initState();
  }


  dispose(){
    controller.dispose();
    super.dispose();
  } 


  Widget _buildSelectQuantityWidget(){

    return TextField(
      controller: quantityController,
      onTap: (){

      },
      onChanged: (value){

      },
      decoration: InputDecoration(
        hintText: 'ادخل الكمية المطلوبة',
        hintStyle: TextStyle(fontSize: 15,color: Colors.black54)
      ),
      keyboardType: TextInputType.number,
      maxLength: 3,
    );

    // List<int> quantity = controller.buildAvilableQunatityOptions();
    //
    // return Obx((){
    //   return DropdownButton<int>(
    //       hint: Text('اختر الكمية',style: TextStyle(fontSize: 15,color: Colors.black54),),
    //       value: selectedQuantity.value,
    //       items:quantity.map((obj)=>DropdownMenuItem<int>(
    //       value: obj,
    //       child: Text(obj.toString(),style: TextStyle(fontSize: 15,color: Colors.black54),))).toList(),
    //       underline: Container(
    //         height: 1.0,
    //         decoration: BoxDecoration(
    //             border: Border(
    //                 bottom: BorderSide(
    //                     color: ColorsManager.customGrey,
    //                     width: 0.5
    //                 )
    //             )
    //         ),
    //       ),
    //       onChanged:(value){
    //        selectedQuantity.value = value!;
    //       });
    // });
  }

  Widget _buildSelectUnitType(){
    selectedUnit = controller.currentUnits!.first.id!.obs;
    /*

     */
    return Obx(()=> DropdownButton<int?>(
        value: selectedUnit?.value,
        hint: Text('اختر واحدة القياس',style: TextStyle(fontSize: 15,color: Colors.black54),),
        items: controller.currentUnits?.map((obj)=>DropdownMenuItem<int?>(
            value: obj.id,
            child: Text(obj.name.toString(),style:
            TextStyle(fontSize: 15,color: Colors.black54),))).toList(),
        underline: Container(
          height: 1.0,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: ColorsManager.customGrey,
                      width: 0.5
                  )
              )
          ),
        ),
        onChanged: (value){
          selectedUnit?.value = value!;

        }));
  }
  
  Widget _buildAddToCartButton(BuildContext context){
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsManager.customTeal),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevation: MaterialStateProperty.all(5),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        onPressed: (){

          controller.mapUnitsToCurrentItem();

          showDialog(context: context,
              builder: (ctx){
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('هل تريد اضافة هذا المنتج إلى سلة الشراء الخاصة بك ؟',style: TextStyle(fontSize: 15,color: Colors.black54,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
                  SizedBox(height: 12.h,),
                  _buildSelectUnitType(),
                  SizedBox(height: 8.h,),
                  _buildSelectQuantityWidget()
                ],
              ),
              actions: [TextButton(onPressed: ()async{
                Navigator.pop(context);

                int? itemUnitIdToSend = controller.itemUnitsModel?.units.firstWhere((obj)=> obj.unitId == selectedUnit?.value).id;
               final response = await controller.addItemToCart(itemUnitId: itemUnitIdToSend,quantity: num.parse(quantityController.text).toInt());

               response.fold((error){
                 ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('المنتج موجود في سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.red,)
                         );
               }, (status){
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('تمت اضافة المنتج إلى سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.green,)
                     );
               });

               Future.delayed(Duration(seconds: 3),(){
                 Navigator.pop(context);
               });

              }, child: Text('تأكيد',style: TextStyle(fontSize: 15,color: ColorsManager.customTeal,fontFamily: 'Roboto',fontWeight: FontWeight.w600),))],
            ) ;
          },);
          
          //   GroceryItem item = GroceryItem(itemName: product.name, itemDescription: 'TEST', imagePath: 'assets/images/cart_item_pic.png', itemPrice: 100.00);
          //
          //   ShoppingCartController cartController = Get.find<ShoppingCartController>();
          //
          //   bool isAlreadyExists = false;
          //   for(GroceryItem temp in cartController.cartItems){
          //     if(temp.itemName == item.itemName){
          //       isAlreadyExists = true;
          //     }
          //   }
          //
          //   if(isAlreadyExists){
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text('المنتج موجود في سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.red,)
          //     );
          //
          //   }else{
          //     cartController.cartItems.add(item);
          //     ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(content: Text('تمت اضافة المنتج إلى سلة الشراء',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),backgroundColor: Colors.green,)
          //     );
          //   }
          // cartController.calculateTotalPrice();
        }, child: Icon(Icons.add_shopping_cart,color: Colors.white,));
  }
  
  
  Widget _buildPropertiesRow({required String firstTitle , required String firstValue , required String secondTitle , required String secondValue}){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$firstTitle : ',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
        Expanded(child: Text(firstValue,style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),)),
        SizedBox(width: 8.w,),
        Text('$secondTitle : ',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
        Expanded(flex:2,child: Text(secondValue,style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),)),
      ],
    );
  }
  
  Widget _buildCenterText(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('ITEM DETAILS',style: TextStyle(fontSize: 16,color: ColorsManager.customTeal,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back,color: ColorsManager.customTeal,size: 25,)),
        ),
       body: SafeArea(
         child: SingleChildScrollView(
           child: Padding(
             padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
             child: Obx((){

               if(controller.isExists.isTrue) {
                 //print('all IDs ${controller.itemUnitModel!.id} ${controller.itemDetailsModel!.id} ::');

                 return Column(
                   children: [
                     Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0)
                         ),
                         clipBehavior: Clip.antiAlias,
                         child: controller.itemDetailsModel!.image != null ? Image.network(ApiConstants.imageBaseUrl + 'storage/' + controller.itemDetailsModel!.image.toString()) :Image.asset('assets/images/cart_item_pic.png',
                           fit: BoxFit.fitWidth,)),
                     SizedBox(height: 10.h,),
                     _buildCenterText(controller.itemDetailsModel!.name.toString()),
                     SizedBox(height: 5.h,),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Expanded(child: Text(
                           controller.itemDetailsModel!.description.toString(),
                           style: TextStyle(fontSize: 15,
                               color: Colors.black54,
                               fontFamily: 'Roboto'),)),
                       ],
                     ),
                     SizedBox(height: 10.h,),
                     _buildPropertiesRow(firstTitle: 'Quantity',
                         firstValue: controller.itemDetailsModel!.availableQuantity.toString(),
                         secondTitle: 'Unit',
                         secondValue: controller.itemDetailsModel!.unitName.toString()),
                     SizedBox(height: 5.h,),
                     _buildPropertiesRow(firstTitle: 'Price',
                         firstValue: '${controller.itemDetailsModel!.pricePerUnit} \$',
                         secondTitle: 'Supplier',
                         secondValue: controller.itemDetailsModel!.supplierName.toString()),

                     SizedBox(height: 20.h,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         SizedBox(
                           width: 100.w,
                           height: 40.h,
                           child: _buildAddToCartButton(context),
                         )
                       ],
                     )
                   ],
                 );
               }else{

                 return Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CircularProgressIndicator(
                       color: ColorsManager.customTeal,
                     ),
                   ],
                 );

                 // return Container(
                 //   margin: EdgeInsets.symmetric(vertical: 40.h),
                 //   child: Text(controller.errorMessage.value,style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.w500),),
                 // );
               }
             })
           ),
         ),
       ),

      ),
    );
  }
}
