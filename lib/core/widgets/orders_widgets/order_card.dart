import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../networking/api_constants.dart';


class OrderCard extends StatelessWidget {

  final String paymentType;
  final String status;
  final String totalPrice;
  final int? points;
  final String finalPrice;
  final String? imagePath;

  OrderCard({
    required this.paymentType,
    required this.status,
    required this.totalPrice,
    required this.points,
    required this.finalPrice,
    required this.imagePath
});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w
        ),
        child: Column(
          children: [
            Container(

              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0) ,topRight: Radius.circular(10.0)),
              ),
              child: imagePath == null ? Image.asset('assets/images/meal_logo.png',fit: BoxFit.fitWidth,):Image.network(ApiConstants.imageBaseUrl +'storage/'+imagePath.toString(),fit: BoxFit.fitWidth,),
            ) ,

            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(status,style: TextStyle(fontSize: 18,color: status == 'pending'? Colors.yellow.shade500:Colors.green,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(child: Text('Payment Type : ${paymentType}',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),)),
                Expanded(child: Text('Points Used : ${points}',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),))

              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(child: Text('Total Price : ${totalPrice} \$',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),)),
                Expanded(child: Text('Actual Price : ${finalPrice} \$',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),))

              ],
            ),


          ],
        ),
      ),
    );
  }
}
