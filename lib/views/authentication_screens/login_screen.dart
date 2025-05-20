import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/login_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/helpers/app_regex.dart';
import '../../core/routing/routes.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../../core/widgets/custom_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginController loginController = Get.find<LoginController>();


  Widget _dontHaveAnAccountText(BuildContext context){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب ؟',
            style: TextStyle(fontSize: 13,color: Colors.black),
          ),
          TextSpan(
            text: 'انشاء حساب',
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
               Navigator.pushNamed(context, Routes.registerScreen);
              },
          ),
        ],
      ),
    );
  }

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
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: ColorsManager.customTeal,
                ),
                SizedBox(height: 48.h,),
                _buildCenterText('يرجى إدخال بياناتك', TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                )),
                SizedBox(height: 24.h,),
                Form(
                  key: loginController.formKey ,
                  child: Column(
                    children: [
                      AppTextFormField(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
                        hintText: 'اسم المستخدم', controller: loginController.nameController, validator: (value){
                        if(value!.isEmpty || value == null){
                          return 'يجب إدخال اسم المستخدم';
                        }
                        if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)){
                          return 'ادخل بريد الكتروني صالح';
                        }
                      },
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.3,
                                color: ColorsManager.customWhite
                            ),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        fillColor: ColorsManager.customWhite,

                      ),
                      SizedBox(height: 16.h,),
                      Obx(()=>AppTextFormField(
                        suffixIcon:  IconButton(onPressed: (){
                          loginController.showPassword.toggle();
                        }, icon: Icon(
                        loginController.showPassword.isTrue ?  Icons.visibility:Icons.visibility_off,
                        color: Colors.grey,
                        )),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
                        hintText: 'كلمة السر', controller: loginController.passwordController, validator: (value){
                        if(value!.isEmpty || value == null){
                          return 'يرجى إدخال كلمة السر';
                        }
                        if(value.length < 8 ){
                          return 'يجب ألا يقل طول كلمة عن 8 محارف';
                        }

                      },
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.3,
                                color: ColorsManager.customWhite
                            ),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        fillColor: ColorsManager.customWhite,
                        isObscureText: loginController.showPassword.value,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 48.h,),
                CustomButton(borderRadius: 8.0,buttonText: 'تسجيل الدخول', textStyle: TextStyle( fontFamily: 'Roboto',fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600), onPressed: (){
                  if(loginController.formKey.currentState!.validate()){
                    Navigator.pushNamed(context, Routes.homeScreen);
                  }

                },buttonWidth: 360,buttonHeight: 60,),
                SizedBox(height: 5.h,),
                _dontHaveAnAccountText(context)



              ],
            ),
          ),
        ),
      ),
    );
  }
}
