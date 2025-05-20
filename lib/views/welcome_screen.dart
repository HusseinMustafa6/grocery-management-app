import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_managemnet/controllers/welcome_controller.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class WelcomeScreen extends StatelessWidget {

  final WelcomeController welcomeController = Get.find<WelcomeController>();

  Widget _buildCenterText(String text,TextStyle style){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: style ,)
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h ),
            child: Column(
              children: [
                _buildCenterText('إدارة مستودع غذائيات', TextStyle(fontSize: 24,color: ColorsManager.customTeal,letterSpacing: 1.3,fontWeight: FontWeight.w600,fontFamily: 'Roboto')),
                SizedBox(height: 80.h,),
                SvgPicture.asset('assets/svgs/food_shoping.svg',width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.fitWidth,),
                SizedBox(height: 80.h,),
                _buildCenterText(' خيارك الأنسب و الأسهل', TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w500,fontFamily: 'Roboto')),

                _buildCenterText('لإدارة المخزونات الغذائية الوسيطية', TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w500,fontFamily: 'Roboto')),
                SizedBox(height: 80.h,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CustomButton(buttonText: 'أبدا', textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto'), onPressed: (){
                    // welcomeController.goToRegisterScreen();

                    Navigator.pushNamed(context, Routes.registerScreen);
                  }),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
