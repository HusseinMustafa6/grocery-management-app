import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/register_controller.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/app_text_form_field.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/helpers/app_regex.dart';
import '../../core/routing/routes.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  File? selectedImage;
  RegisterController registerController = Get.find<RegisterController>();


  Future pickImage(ImageSource source)async{

    try{
     final image = await ImagePicker().pickImage(source: source);

     if(image == null)
       return;

     setState(() {
       selectedImage = File(image.path);
     });


    }on PlatformException catch (e) {
      print(e);
    }


  }


  Widget _buildAlreadyHaveAnAccountText(BuildContext context){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: ' لديك حساب مسبقاً؟',
            style: TextStyle(fontSize: 13,color: Colors.black),
          ),
          TextSpan(
            text: 'تسجيل الدخول',
            style: TextStyle(fontSize: 13,color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.loginScreen);
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



 Widget _buildSelectImageWidget(){

    return GestureDetector(
      onTap: ()async{
        await pickImage(ImageSource.gallery);
      },
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w ,vertical:15.h ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ColorsManager.customWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('صورة ترخيص المحل',style: TextStyle(fontSize: 14,color: ColorsManager.customGrey),),
            Icon(Icons.image_outlined,color: ColorsManager.customGrey,size: 30,),
          ],
        ),
      ),
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              children: [
                SizedBox(height: 40.h ,),
                _buildCenterText('طلب إنشاء حساب', TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                )),
                SizedBox(height: 59.h ,),
                _buildCenterText('يرجى إدخال بياناتك', TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                )),
                SizedBox(height: 24.h ,),

                Form(
                  key: registerController.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(

                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
                        hintText: 'الاسم', controller: registerController.nameController, validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'يجب إدخال اسم المستخدم';
                        }
                        if (value.length < 3) {
                          return 'يجب أن يكون طول اسم المستخدم على الأقل 3';
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
                      SizedBox(height: 16.h ,),
                      AppTextFormField(

                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
                        hintText: 'البريد', controller: registerController.emailController, validator: (value){
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isEmailValid(value)) {
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
                      SizedBox(height: 16.h ,),
                      AppTextFormField(

                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
                        hintText: 'رقم الهاتف', controller: registerController.phoneController, validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'يجب إدخال رقم الهاتف';
                        }
                        if (value.length != 10) {
                          return 'يجب أن يتكون رقم الهاتف من 10 خانات';
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
                        textInputType: TextInputType.phone,

                      ),
                      SizedBox(height: 16.h ,),
                    ],
                  ),
                ),


                _buildSelectImageWidget(),
                SizedBox(height:10.h ,),
                selectedImage == null? SizedBox.shrink():
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.file(selectedImage!,
                  fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 40.h ,),
                CustomButton(borderRadius: 8.0,buttonText: 'تسجيل', textStyle: TextStyle( fontFamily: 'Roboto',fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600), onPressed: (){

                 registerController.formKey.currentState!.validate();

                },buttonWidth: 360,buttonHeight: 60,),
                SizedBox(height: 5.h ,),
                _buildAlreadyHaveAnAccountText(context)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
