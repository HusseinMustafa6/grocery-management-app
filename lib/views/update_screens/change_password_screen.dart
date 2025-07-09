import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/profile_controller.dart';
import 'package:food_managemnet/core/helpers/app_regex.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/app_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/widgets/custom_button.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {


  final ProfileController profileController = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
            child: Column(
              children: [

                Row(
                  children: [
                    Text('تغير كلمة المرور',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: ColorsManager.customTeal),)
                  ],
                ),
                SizedBox(height: 50.h,),
                Form(
                  key: profileController.passwordFormKey,
                  child: Column(
                    children: [

                      Obx(()=>
                      AppTextFormField(
                          hintText: 'كلمة المرور القديمة',
                          controller: profileController.oldPasswordController,
                          validator: (value){

                            if( !AppRegex.hasMinLength(value!)){
                              return 'طول كلمة المرور على الأقل 8 محارف';
                            }

                      } ,
                      isObscureText: profileController.showOldPassword.value,
                      suffixIcon: IconButton(onPressed: (){
                        profileController.showOldPassword.toggle();
                      }, icon: Icon(profileController.showOldPassword.isTrue ? Icons.visibility:Icons.visibility_off )),
                      )),
                      SizedBox(height: 10.h,),
                      Obx(()=>
                          AppTextFormField(
                            hintText: 'كلمة المرور الجديدة',
                            controller: profileController.newPasswordController,
                            validator: (value){

                              if( !AppRegex.hasMinLength(value!)){
                                return 'طول كلمة المرور على الأقل 8 محارف';
                              }

                              if( !AppRegex.hasLowerCase(value) ){
                                return 'يجب أن تحتوي كلمة المرور الجديدة على أحرف صغيرة';
                              }

                              if(!AppRegex.hasNumber(value)){
                                return 'يجب أن تحتوي كلمة المرور الجديدة على أرقام';
                              }

                              if(!AppRegex.hasUpperCase(value)){
                                return 'يجب أن تحتوي كلمة المرور الجديدة على أحرف كبيرة';
                              }

                            } ,
                            isObscureText: profileController.showNewPassword.value,
                            suffixIcon: IconButton(onPressed: (){
                              profileController.showNewPassword.toggle();
                            }, icon: Icon(profileController.showNewPassword.isTrue ? Icons.visibility:Icons.visibility_off )),
                          )),
                      SizedBox(height: 10.h,),
                      Obx(()=>
                          AppTextFormField(
                            hintText: 'تأكيد كلمة المرور',
                            controller: profileController.newPasswordConfirmationController,
                            validator: (value){
                            if(profileController.newPasswordConfirmationController.text != profileController.newPasswordController.text){
                              return 'كلمة المرور و تأكيد كلمة المرور غير متطابقان';
                            }

                            } ,
                            isObscureText: profileController.showNewPassword.value,
                            suffixIcon: IconButton(onPressed: (){
                              profileController.showNewPassword.toggle();
                            }, icon: Icon(profileController.showNewPassword.isTrue ? Icons.visibility:Icons.visibility_off )),
                          )),

                    ],
                  ),
                ),
                SizedBox(height: 50.h,),
                CustomButton(
                    buttonWidth: MediaQuery.of(context).size.width * 0.7,
                    buttonHeight: 60,
                    buttonText: 'تعديل', textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto'), onPressed: (){
                  profileController.passwordFormKey.currentState?.validate();
                })


              ],
            ),
          ),
        ),
      ),
    );
  }
}
