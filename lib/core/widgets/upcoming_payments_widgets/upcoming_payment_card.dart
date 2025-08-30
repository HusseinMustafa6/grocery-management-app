import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/models/upcoming_payments_models/upcoming_payment_model.dart';


class UpcomingPaymentCard extends StatelessWidget {

  UpcomingPaymentModel upcomingPaymentModel;

  UpcomingPaymentCard(this.upcomingPaymentModel);

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تفاصيل الدفع للطلب رقم ${upcomingPaymentModel.orderId}',style: TextStyle(fontSize: 18,color: ColorsManager.customTeal,
                    fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)
              ],
            ),
            SizedBox(height: 10.h,),
            Column(
              children: [
                Expanded(child: Text('المبلغ المدفوع : ${upcomingPaymentModel.paidAmount} \$',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),)),
                Expanded(child: Text('المبلغ المتبقي : ${upcomingPaymentModel.remainingAmount} \$',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),)),
                Expanded(child: Text('تاريخ الدفع : ${upcomingPaymentModel.dueDate}',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto'),))

              ],
            ),
            SizedBox(height: 5.h,),


          ],
        ),
      ),
    );
  }
}
