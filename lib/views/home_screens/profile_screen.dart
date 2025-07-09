import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/controllers/home_controllers/profile_controller.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theming/colors_manager.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final ProfileController profileController = Get.find<ProfileController>();


  @override
  void initState() {
    setState(() {
      profileController.getData();

    });
  }


  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source); //selected image will be stored here
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        profileController.testImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }


  Widget _buildEntryFiled(String hintText,
      TextEditingController controller , RxBool enableEdit) {
    return Obx(()=>Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        enabled: enableEdit.value,
        controller: controller,
        onChanged: (value) {},
        obscureText: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none
          ),
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
        //textAlign: TextAlign.end
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              //height: MediaQuery.of(context).size.height *0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Container(
                      child: profileController.testImage == null
                          ? CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(
                          'assets/images/profile_place_holder.png',
                        ),
                      )
                          :  CircleAvatar(
                        radius: 50.0,
                        backgroundImage: FileImage(profileController.testImage!),
                      ),
                    ),
                    Positioned(
                        top: -8,
                        left: 67,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () async {

                              await pickImage(ImageSource.gallery);
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: ColorsManager.customTeal,
                            ),
                            splashRadius: 10,
                          ),
                        ))
                  ]),
                  Text(
                    profileController.userNameController.text,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h,),
            _buildEntryFiled('ادخل اسم المستخدم..', profileController.userNameController, profileController.enableEdit),
            _buildEntryFiled('البريد الإلكتروني الخاص بك..', profileController.emailController, profileController.enableEdit),
            _buildEntryFiled('رقم الهاتف..', profileController.phoneController, profileController.enableEdit),
            SizedBox(height: 50.h,),
            CustomButton(
                buttonWidth: MediaQuery.of(context).size.width * 0.7,
                buttonHeight: 60,
                buttonText: 'تعديل', textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto'), onPressed: (){
                 profileController.enableEdit.toggle();
            }),
            SizedBox(height: 30.h,),
            CustomButton(
                buttonWidth: MediaQuery.of(context).size.width * 0.7,
                backgroundColor: ColorsManager.customCyan,
                buttonHeight: 60,
                buttonText: 'تغير كلمة المرور', textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto'), onPressed: (){
               Navigator.pushNamed(context, Routes.changePasswordScreen);
            })




          ],
        ),
      ),
    );
  }
}
